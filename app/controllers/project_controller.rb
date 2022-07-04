# frozen_string_literal: true

class ProjectController < ApplicationController
  def run_rovers
    results = []
    lines[1..].each_with_index do |line, index|
      next if index.odd?

      rover = NasaRover::Rover.new(plateau: plateau, coordinate_x: line[0], coordinate_y: line[2], direction: line[4])
      results << rover.process_movements(lines[index + 2])
    end

    render json: results.join("\n"), status: 200
  end

  private

  def lines
    @lines ||= file.readlines.map(&:chomp)
  end

  def file
    File.open(params[:file])
  end

  def plateau
    NasaRover::Plateau.new(size: lines[0])
  end
end
