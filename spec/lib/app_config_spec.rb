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
      it 'should have a default format' do
        expect(subject.format).to eq('jpg')
      end
    end
    context 'with arguments' do
      options = { iso: 100, shutter: 125, format: 'exr' }
      subject = AppConfig.new(options)

      options.each do |key, val|
        it "responds to #{key} and had the correct value of #{val}" do
          expect(subject).to respond_to(key.to_sym)
          expect(subject.send(key)).to eq(options[key.to_sym])
        end
      end
      it 'overrides an existing option' do
        expect(subject.format). to eql('exr')
      end
    end
  end
end
