#!/usr/bin/env ruby

require 'RMagick'
include Magick

image = Image.read('../timelapse/images-2pm/image-000000.jpg')

image.first.format

image.first.write('image.exr')
