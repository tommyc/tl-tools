# frozen_string_literal: true

require './lib/image'
require './lib/dir_utils'
require './lib/image_criteria'

class ImageProcessor
  include DirUtils

  attr_accessor :counter
  attr_reader :config

  def initialize(config_object)
    @counter = 0
    @config = config_object
  end
  # rubocop:disable Metrics/AbcSize

  def process # rubocop:disable Metrics/MethodLength
    Dir.chdir(config.source)
    dir_list('*').each do |year|
      Dir.chdir(year)
      dir_list('*').each do |month|
        Dir.chdir(month)
        dir_list('*').each do |day|
          Dir.chdir(day)
          file_list(config.input).each do |file|
            process_image(file)
          end
        end
      end
    end
  end

  def process_image(file)
    image = Image.new(file)
    return unless ImageCriteria.new(image, config).meets_criteria?
    image.save(file, image.new_name(config.destination, counter))
    @counter += 1
  end
end
