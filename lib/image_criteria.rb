# frozen_string_literal: true

class ImageCriteria # :nodoc:
  attr_reader :image, :config
  def initialize(image, config_object)
    @image = image
    @config = config_object
  end

  def meets_criteria?
    build_criteria.all?(&:call)
  end

  def build_criteria
    conditions = []
    conditions << proc { config.range.include?(image.hour) }
    conditions << proc { image.min.between?(0, 7) }
    conditions << proc { config.range.include?(image.hour) }
    conditions << proc { image.iso == config.iso } if config.respond_to?(:iso)
    conditions << proc { image.shutter == config.shutter } if config.respond_to?(:shutter)
    conditions
  end
end
