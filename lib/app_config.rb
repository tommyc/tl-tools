# frozen_string_literal: true

require 'yaml'

class AppConfig
  attr_accessor :source, :destination, :input, :output, :range

  def initialize(options = {})
    config = YAML.load_file('config/config.yml')
    @source = config['source']
    @destination = config['destination']
    @output = config['output']
    @input = config['input']
    @range = config['range']
    process_options(options) unless options.empty?
  end

  private

  def process_options(options)
    options.each do |key, val|
      self.class.module_eval { attr_reader key.to_sym }
      instance_variable_set("@#{key}", val)
    end
  end
end
