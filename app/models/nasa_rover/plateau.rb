# frozen_string_literal: true

module NasaRover
  class Plateau
    def initialize(size:)
      @size = size
    end

    attr_reader :size

    def max_x
      size[0].to_i
    end

    def max_y
      size[2].to_i
    end
  end
end
