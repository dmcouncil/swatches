# Given a base color and name, this class will generate a string of
# SASS that represents a full range of tints and shades based on
# the given color.

module Swatches
  class SwatchGenerator

    def initialize(base_color, color_name)
      @tint_calculator = TintCalculator.new(base_color)
      @color_name = color_name
    end

    def to_sass
      output = ""
      0.upto(50).each do |i|
        lightness = i*2
        color = @tint_calculator.generate_color_for_lightness(lightness)
        output << "$#{@color_name}-#{lightness}: #{color.inspect};\n"
      end
      output
    end

  end
end
