module Swatches
  class Engine < ::Rails::Engine
    isolate_namespace Swatches
    initializer "swatches.configure" do |app|
      require File.join(Rails.root, 'config', 'swatches')
    end
    config.assets.precompile += %w( swatches.css )
  end
end
