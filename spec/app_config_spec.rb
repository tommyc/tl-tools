# frozen_string_literal: true

require 'app_config'

RSpec.describe AppConfig do
  describe '#initialize' do
    context 'with no arguments' do
      subject = AppConfig.new
      it 'creates a new AppConfig instance' do
        expect(subject).to be_instance_of(AppConfig)
      end
      it 'should have a source' do
        expect(subject).to respond_to(:source)
      end
      it 'should have a destination' do
        expect(subject).to respond_to(:destination)
      end
      it 'should have a default input format' do
        expect(subject.input).to eq('jpg')
      end
      it 'should have a default output format' do
        expect(subject.output).to eq('jpg')
      end
      it 'should not respond to options if not given' do
        expect(subject).not_to respond_to(:foo)
      end
    end
    context 'with arguments' do
      options = { iso: 100, shutter: 125, input: 'exr', output: 'tiff' }
      subject = AppConfig.new(options)

      options.each do |key, val|
        it "responds to #{key} and had the correct value of #{val}" do
          expect(subject).to respond_to(key)
          expect(subject.send(key)).to eq(val)
        end
      end
      it 'overrides a default option' do
        expect(subject.input).to eql('exr')
      end
    end
  end
end
