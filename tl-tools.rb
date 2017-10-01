#!/usr/bin/env ruby

# frozen_string_literal: true

require './lib/app_config'
require './lib/dir_utils'
require './lib/image_processor'
require 'getoptlong'

include DirUtils

opts = GetoptLong.new(
  ['--help', GetoptLong::NO_ARGUMENT],
  ['--iso', GetoptLong::OPTIONAL_ARGUMENT],
  ['--shutter', GetoptLong::OPTIONAL_ARGUMENT],
  ['--input', GetoptLong::OPTIONAL_ARGUMENT],
  ['--output', GetoptLong::OPTIONAL_ARGUMENT]
)

options = {}
opts.each do |opt, arg| # rubocop:disable Metrics/BlockLength
  case opt
  when '--help'
    puts <<~HEREDOC
      tl-tools [OPTIONS]

      --help:
        show help

      -- iso:
         look for images with a specific iso

      --shutter:
         look for images with a specific shutter speed

      --input:
         look for a specific image type (ex. 'jpg')

      --output:
        output file type (ex. 'png')

      --range
        array time range of hours to match against in 24hr format. (ex. [12,13,14])
    HEREDOC
    exit

  when '--iso'
    options[:iso] = arg.to_i
  when '--shutter'
    options[:shutter] = arg.to_i
  when '--input'
    options[:input] = arg.to_s
  when '--output'
    options[:output] = arg.to_s
  when '--range'
    options[:range] = arg
  end
end

ImageProcessor.new(AppConfig.new(options)).process
