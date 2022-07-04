# frozen_string_literal: true

module NasaRover
  class Rover
    DIRECTIONS = %i[W N E S].freeze

    def initialize(plateau:, coordinate_x:, coordinate_y:, direction:)
      @plateau = plateau
      @coordinate_x = coordinate_x.to_i
      @coordinate_y = coordinate_y.to_i
      @direction = DIRECTIONS.index direction.to_sym
    end

    attr_reader :plateau, :coordinate_x, :coordinate_y, :direction

    def process_movements(movements)
      movements.split('').each do |movement|
        align_direction

        case movement
        when 'L'
          turn_left
        when 'R'
          turn_rigth
        when 'M'
          return 'Lost Rover' unless movement_possible?

          go_ahead if movement_possible?
        else
          raise MovementImpossible, movement
        end
      end

      result
    end

    def result
      "#{@coordinate_x} #{@coordinate_y} #{DIRECTIONS[@direction]}"
    end

    private

    def align_direction
      @direction = 0 if @direction == -4
      @direction = -1 if @direction == 3
    end

    def turn_left
      @direction -= 1
    end

    def turn_rigth
      @direction += 1
    end

    def go_ahead
      @direction += 4 if @direction.negative?
      case DIRECTIONS[@direction]
      when :W
        @coordinate_x -= 1
      when :N
        @coordinate_y += 1
      when :E
        @coordinate_x += 1
      when :S
        @coordinate_y -= 1
      end
    end

    def movement_possible?
      case DIRECTIONS[@direction]
      when :W
        @coordinate_x != 0
      when :N
        @coordinate_y != plateau.max_y
      when :E
        @coordinate_x != plateau.max_x
      when :S
        @coordinate_y != 0
      end
    end
  end

  class MovementImpossible < StandardError
    def initialize(movement)
      super("#{movement} is an impossible movement")
    end
  end
end
