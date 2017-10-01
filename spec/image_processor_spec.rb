# frozen_string_literal: true

require './lib/image_processor'
require './lib/app_config'
require './lib/image'

RSpec.describe ImageProcessor do
  config = AppConfig.new
  subject = ImageProcessor.new(config)
  describe '#initialize' do
    it 'creates a new ImageProcessor instance' do
      expect(subject).to be_instance_of(ImageProcessor)
    end
    it 'accepts an AppConfig object' do
      expect(subject.config).to be_instance_of(AppConfig)
    end
  end
  describe '#process_image' do
    let(:file) { '/Users/tommy/source/tl-tools/spec/images/GOPR2471.jpg' }
    context 'when meet_criteria? returns true' do
      it 'should increment @counter' do
        subject.process_image(file)
        expect(subject.counter).to eq(1)
      end
      it 'should call save' do
        expect(subject).to receive(:image_save)
        subject.process_image(file)
      end
    end
    context 'when image meet_criteria? returns false' do
      before do
        subject.counter = 0
        config.range = [19, 20]
      end
      it 'should not increment @counter' do
        subject.process_image(file)
        expect(subject.counter).to eq(0)
      end
      it 'should not call save' do
        expect(subject).not_to receive(:image_save)
        subject.process_image(file)
      end
    end
  end

  describe '#new_name' do
    it 'renames the image' do
      expect(subject.new_name('/foo/', '.jpg', 1)).to eq '/foo/image-000001.jpg'
    end
  end
end
