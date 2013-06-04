# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

namespace :assets do
  desc "A little hack to make sprockets handle Bower files w/o filenames"
  # see https://github.com/sstephenson/sprockets/issues/347
  task :precompile do
    Dir['app/assets/components/**/*'].each do |filename|
      if File.file?(filename) && File.extname(filename) == ''
        File.rename(filename, "#{filename}.txt")
      end
    end
  end
end

require File.expand_path('../config/application', __FILE__)

CodeCruise::Application.load_tasks
