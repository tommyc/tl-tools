# frozen_string_literal: true

require 'image'

RSpec.describe Image do
  let(:image) { 'spec/images/GOPR2301.jpg' }
  let(:subject) { Image.new(image) }
  image_attrs = { name: String,
                  ext: String,
                  iso: Integer,
                  shutter: Integer,
                  hour: Integer,
                  min: Integer }

  describe '#initialize' do
    it 'creates an instance of Image' do
      expect(subject).to be_instance_of(Image)
    end
  end
  describe 'image has required image attributes' do
    image_attrs.each_key do |key|
      it "has attribute #{key}" do
        expect(subject).to respond_to(key)
      end
    end
  end
  describe 'each image attribute is the correct type' do
    image_attrs.each do |key, val|
      it "#{key} is a #{val}" do
        expect(subject.send(key.to_sym)).to be_a(val)
      end
    end
  end
end
