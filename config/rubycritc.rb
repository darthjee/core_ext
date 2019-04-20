# frozen_string_literal: true

require 'rubycritic/rake_task'

RubyCritic::RakeTask.new do |task|
  options = %w[
    --branch master
    --path rubycritic/
    --no-browser
  ]
  task.options = options.join(' ')
  task.paths   = %w[lib]
end
