class Rover 
  # FIXME Romulo - module
  # FIXME Romulo - tratar coordenada 0
  # FIXME Romulo - receber plateau
  # FIXME Romulo - named params
  # FIXME Romulo - zerar directions
  # FIXME Romulo - name functions
  # FIXME Romulo - limitar rover pelo plateau
  DIRECTIONS = [:W, :N, :E, :S].freeze

  def initialize(x, y, direction)
    @coordenada_x = x
    @coordenada_y = y
    @direction = DIRECTIONS.index direction.to_sym
  end

  attr_reader :coordenada_x, :coordenada_y, :direction

  def to_s
    "#{@coordenada_x} #{@coordenada_y} #{DIRECTIONS[@direction]}"
  end

  def processar_movimentos(movimentos)
    movimentos.split("").each do |movimento|
      @direction = 0 if @direction == -4 
      @direction = -1 if @direction == 3 

      if movimento == 'L'
        @direction -= 1
      elsif movimento == 'R'
        @direction += 1
      elsif movimento == 'M'
        processar_passo
      end
    end

    to_s
  end 

  private

  def processar_passo
    @direction += 4 if @direction < 0

    case DIRECTIONS[@direction]
    when :W
      @coordenada_x -= 1
    when :N
      @coordenada_y += 1
    when :E
      @coordenada_x += 1
    when :S
      @coordenada_y -= 1
       # FIXME Romulo - Se coordenada for 0
    end
  end

end

  