# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rover, type: :model do
  DIRECTIONS = %i[W N E S].freeze

  describe '.processar movimentos' do
    let(:direction) { 'N' }
    let(:rover) { Rover.new(1, 1, direction) }

    context 'movimento para esquerda (L)' do
      it 'deve diminuir direction por 1' do
        expect { rover.process_movements('L') }.to change { rover.direction }.by(-1)
      end

      context '4 moviments L' do
        let(:direction) { 'W' }
        it do
          expect { rover.process_movements('LLLL') }.not_to change { DIRECTIONS[rover.direction] }.from(:W)
        end
      end
    end

    context 'movimento para direita (R)' do
      it 'deve aumentar direction por 1' do
        expect { rover.process_movements('R') }.to change { rover.direction }.by(1)
      end

      context '4 moviments R' do
        let(:direction) { 'N' }
        it do
          expect { rover.process_movements('RRRR') }.not_to change { DIRECTIONS[rover.direction] }.from(:N)
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
  end
end
