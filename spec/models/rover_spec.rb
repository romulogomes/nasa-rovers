# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NasaRover::Rover do
  describe '#process_movements' do
    let(:directions) { %i[W N E S].freeze }
    let(:direction) { 'N' }
    let(:plateau) { NasaRover::Plateau.new(size: '5 5') }
    let(:rover) { described_class.new(plateau: plateau, coordinate_x: 1, coordinate_y: 1, direction: direction) }

    context 'movement for left (L)' do
      it 'decrease direction by 1' do
        expect { rover.process_movements('L') }.to change { rover.direction }.by(-1)
      end

      context 'more of 4 movements L' do
        let(:direction) { 'W' }
        it do
          expect { rover.process_movements('LLLLL') }.to change { directions[rover.direction] }.from(:W).to(:S)
        end
      end
    end

    context 'movement para direita (R)' do
      it 'increase direction by 1' do
        expect { rover.process_movements('R') }.to change { rover.direction }.by(1)
      end

      context '4 moviments R' do
        let(:direction) { 'N' }
        it do
          expect { rover.process_movements('RRRR') }.not_to change { directions[rover.direction] }.from(:N)
        end
      end
    end

    context 'forward moviment (M)' do
      context 'when direction is N' do
        it 'increment coordinate by 1 in the current direction' do
          expect { rover.process_movements('M') }.to change { rover.coordinate_y }.by(1)
        end
      end

      context 'when direction is W' do
        let(:direction) { 'W' }
        it 'increment coordinate by 1 in the current direction' do
          expect { rover.process_movements('M') }.to change { rover.coordinate_x }.by(-1)
        end
      end

      context 'when direction is E' do
        let(:direction) { 'E' }
        it 'increment coordinate by 1 in the current direction' do
          expect { rover.process_movements('M') }.to change { rover.coordinate_x }.by(1)
        end
      end

      context 'when direction is S' do
        let(:direction) { 'S' }
        it 'increment coordinate by 1 in the current direction' do
          expect { rover.process_movements('M') }.to change { rover.coordinate_y }.by(-1)
        end
      end
    end

    context 'movement impossible' do
      it do
        expect { rover.process_movements('X') }.to raise_error(NasaRover::MovementImpossible)
      end
    end
  end
end
