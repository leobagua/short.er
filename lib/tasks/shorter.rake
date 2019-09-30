namespace :shorter do
  desc 'Development Setup'
  namespace :development do
    desc 'Create new development working environment'
    task new_environment: :environment do
      Rake::Task['db:create'].execute
      Rake::Task['db:migrate'].execute
    end

    desc 'Create new development working environment'
    task reset_environment: :environment do
      Rake::Task['db:drop'].execute
      Rake::Task['shorter:development:new_environment'].execute
    end
  end
end