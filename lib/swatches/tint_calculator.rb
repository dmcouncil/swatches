require 'sass'

# This class can calculate a tint/shade if you give it a color and desired
# lightness.

module Swatches
  class TintCalculator

    def initialize(base_color)
      @base_color = base_color
      @context = Sass::Script::Functions::EvaluationContext.new({})
    end

    def generate_color_for_lightness(target_lightness)
      return @base_color if lightness_equal?(target_lightness, @base_color.lightness)
      return WHITE if lightness_equal?(target_lightness, 100)
      return BLACK if lightness_equal?(target_lightness, 0)
      if target_lightness > @base_color.lightness
        search_for_color(target_lightness, 0, 100, WHITE)
      else
        search_for_color(target_lightness, 0, 100, BLACK)
      end
    end

  private

    WHITE = Sass::Script::Color.new(red: 255, green: 255, blue: 255)
    BLACK = Sass::Script::Color.new(red: 0, green: 0, blue: 0)

    def search_for_color(target_lightness, low_mix_percentage, high_mix_percentage, mix_color)
      low_color = @context.mix(mix_color, @base_color, Sass::Script::Number.new(low_mix_percentage))
      high_color = @context.mix(mix_color, @base_color, Sass::Script::Number.new(high_mix_percentage))
      return low_color if lightness_equal?(low_color.lightness, target_lightness)
      return high_color if lightness_equal?(high_color.lightness, target_lightness)
      if (low_color.lightness - high_color.lightness).abs < 0.1
        return low_color
      end
      low_distance = (target_lightness - low_color.lightness).abs
      high_distance = (target_lightness - high_color.lightness).abs
      halfway_mix_percentage = (low_mix_percentage + high_mix_percentage) / 2.0
      if low_distance < high_distance
        search_for_color(target_lightness, low_mix_percentage, halfway_mix_percentage, mix_color)
      else
        search_for_color(target_lightness, halfway_mix_percentage, high_mix_percentage, mix_color)
      end
    end

    def lightness_equal?(l1, l2)
      l1.round(1) == l2.round(1)
    end

  end
end
