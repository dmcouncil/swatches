desc "Generate swatches of SASS color variables"
namespace :swatches do
  task :generate => :environment do
    Swatches::FileGenerator.write!
  end
end
