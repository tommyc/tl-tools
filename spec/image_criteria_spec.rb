# frozen_string_literal: true

require './lib/image_criteria'

config_with_options = OpenStruct.new(source: '/foo',
                                     destination: '/bar',
                                     input: 'jpg',
                                     output: 'jpg',
                                     iso: 200,
                                     range: [12, 13])

config_default = OpenStruct.new(source: '/foo',
                                destination: '/bar',
                                input: 'jpg',
                                output: 'jpg',
                                range: [12, 13])

image = OpenStruct.new(name: 'image1',
                       ext: 'jpg',
                       iso: 200,
                       shutter: 125,
                       hour: 12,
                       min: 3)

RSpec.describe ImageCriteria do
  subject { ImageCriteria.new(image, config_with_options) }
  describe '#initialize' do
    it 'creates an new ImageCriteria instance' do
      expect(subject).to be_instance_of(ImageCriteria)
    end
  end

  describe '#meets_criteria?' do
    it 'returns true if all conditions are met' do
      expect(subject.meets_criteria?).to be true
    end
    it 'returns false if any conditions are not met' do
      image.hour = 14
      expect(subject.meets_criteria?).to be false
    end
  end

  describe '#build_criteria' do
    context 'with one optional criteria' do
      it 'should have 4 proc objects' do
        expect(subject.build_criteria.size).to eq 4
      end
    end
    context 'without optional criteria' do
      subject { ImageCriteria.new(image, config_default) }
      it 'should have 3 proc objects' do
        expect(subject.build_criteria.size).to eq 3
      end
    end
  end
end
