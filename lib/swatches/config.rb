module Swatches
  class Config
    attr_writer :stylesheet_directory, :colors

    def colors
      @colors
    end

    def stylesheet_directory
      @stylesheet_directory
    end
  end

  def self.config
    @@config ||= Config.new
  end
end
