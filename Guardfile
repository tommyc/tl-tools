# frozen_string_literal: true

notification :emacs
guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(?<path>.+)\.rb$}) { |m| "spec/#{m[:path]}_spec.rb" }
end
