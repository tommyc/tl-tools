# frozen_string_literal: true

require 'exifr'
require 'fileutils'

class Image # :nodoc:
  attr_reader :iso, :shutter, :hour, :min, :name, :ext
  def initialize(image)
    exif = EXIFR::JPEG.new(image)
    @name = File.basename(image)
    @ext = File.extname(image)
    @iso = exif.iso_speed_ratings
    @shutter = exif.shutter_speed_value
    @hour = exif.date_time.hour
    @min = exif.date_time.min
  end

  def save(f, new_file)
    FileUtils.cp(f, new_file)
  rescue StandardError => e
    abort "******* #{e.message}"
  end

  def new_name(dest, counter)
    "#{dest}image-#{(format '%06d', counter)}#{ext}"
  end
end
