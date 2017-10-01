# frozen_string_literal: true

require 'image'

RSpec.describe Image do
  let(:image) { 'spec/images/GOPR2301.jpg' }
  describe '#initialize' do
    it 'creates an instance of Image' do
      subject = Image.new(image)
      expect(subject).to be_instance_of(Image)
    end
  end
end
