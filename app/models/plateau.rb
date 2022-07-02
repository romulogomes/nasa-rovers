# frozen_string_literal: true

class Plateau
  def initialize(coordenadas)
    @coordenadas = coordenadas
  end

  attr_reader :coordenadas

  def x
    coordenadas[0]
  end

  def y
    coordenadas[1]
  end

  def to_s
    "(#{x}, #{y})"
  end
end
