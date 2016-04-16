#!/usr/bin/env ruby
require 'exifr'

SOURCE_DIR = '/Volumes/MediaBackup/MediaLibrary/Projects/ApartmentTimeLapse'
DESTINATION_DIR = '.'

Dir.chdir(SOURCE_DIR)

CURRENT_DIR = Dir.pwd

first_run = false
curr_hr = nil
prev_hr = nil

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
      filez = Dir.glob('*.jpg')
      filez.each do |f|
        exif_info = EXIFR::JPEG.new(f)
        curr_hr = exif_info.date_time.hour
        if exif_info.date_time.min.between?(0, 7) && curr_hr != prev_hr
          puts "EXIF DATE #{f} - #{exif_info.date_time}"
        end
        prev_hr = exif_info.date_time.hour
      end
      Dir.chdir('..')
    end
    Dir.chdir('..')
  end
end
