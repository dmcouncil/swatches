# Add some convenience methods to what is essentially just an array of
# color names and values
module Swatches
  class Colors

    def self.names
      Swatches.config.colors.map(&:first)
    end

    def self.each_color(&block)
      Swatches.config.colors.each do |name, red, green, blue|
        block.call(name, red.to_i, green.to_i, blue.to_i)
      end
    end

  end
end
