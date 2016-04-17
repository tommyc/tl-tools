#!/usr/bin/env ruby
require 'exifr'
require 'fileutils'
require 'pry'

SOURCE_DIR = '/Volumes/Media/MediaLibrary/Projects/ApartmentTimeLapse/'
#SOURCE_DIR = 'media'
#DESTINATION_DIR = '/Users/tommy/Projects/timelapse/Images2/'
DESTINATION_DIR = '/Volumes/ScaryRaid/Projects/apt_timelapse/Images2/'
Dir.chdir(SOURCE_DIR)

CURRENT_DIR = Dir.pwd

first_run = false
curr_hr = nil
prev_hr = nil

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
        if curr_hr == 14
          if exif_info.date_time.min.between?(0, 7) && curr_hr != prev_hr

            new_file = DESTINATION_DIR + name + '-' + (sprintf '%06d', counter) + '.' + ext
            puts "EXIF DATE #{f} - #{exif_info.date_time}"
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
