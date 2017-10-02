# frozen_string_literal: true

require 'exifr'

class Image
  attr_reader :iso, :shutter, :hour, :min, :name, :ext
  def initialize(image)
    exif = EXIFR::JPEG.new(image)
    @name = File.basename(image)
    @ext = File.extname(image)
    @iso = exif.iso_speed_ratings
    @shutter = exif.shutter_speed_value.denominator
    @hour = exif.date_time.hour
    @min = exif.date_time.min
  end
end
