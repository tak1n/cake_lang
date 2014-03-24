task :default do
  Rake::Task['compile'].invoke
  # Rake::Task['test:unit'].invoke
  # Rake::Task['test:spec'].invoke
  # Rake::Task['test:feature'].invoke
end
