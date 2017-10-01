#!/usr/bin/env ruby
require 'exifr'
require 'fileutils'

SOURCE_DIR = '/Volumes/MediaBackup/MediaLibrary/Projects/ApartmentTimeLapse'
DESTINATION_DIR = '/Users/tommy/Projects/timelapse/images/'

Dir.chdir(SOURCE_DIR)

CURRENT_DIR = Dir.pwd

first_run = false
curr_hr = nil
prev_hr = nil
hr_range = [13, 14, 15, 16]
counter = 0

year_dirs = Dir.glob('*')
year_dirs.each do |yd|
  Dir.chdir(CURRENT_DIR) if first_run
  Dir.chdir(yd)
  first_run = true
  month_dirs = Dir.glob('*')
  month_dirs.each do |md|
    Dir.chdir(md)
    day_dirs = Dir.glob('*')
    day_dirs.each do |dd|
      Dir.chdir(dd)
      filez = Dir.glob('*.{jpg,exr,png,tiff }')
      filez.each do |f|
        #name, ext = f.split('.')
        name = 'image'
        ext = f.split('.').last
        exif_info = EXIFR::JPEG.new(f)
        curr_hr = exif_info.date_time.hour
        iso = exif_info.iso_speed_ratings
        if hr_range.include?(curr_hr)
          if exif_info.date_time.min.between?(0, 7) && curr_hr != prev_hr && iso == 100
            new_file = DESTINATION_DIR + name + '-' + "#{curr_hr}" + '-' + (sprintf '%06d', counter) + '.' + ext
            puts "FILE:#{f} - EXIF DATE:#{exif_info.date_time} ISO:#{iso}"
            FileUtils.cp(f, new_file)
            counter += 1
          end
        end
        prev_hr = exif_info.date_time.hour
      end
      Dir.chdir('..')
    end
    Dir.chdir('..')
  end
end
