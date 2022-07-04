# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Project', type: :request do
  describe '#run_rovers' do
    let(:file) { double('file') }
    let(:lines) { ['5 5', '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'] }

    before do
      allow(File).to receive(:open).and_return(file)
      allow(file).to receive(:readlines).and_return(lines)
    end

    it do
      post '/run_rovers', params: { file: file }
      results_expected = ['1 3 N', '5 1 E']
      expect(response).to be_successful
      expect(response.body).to eq(results_expected.join("\n"))
    end
  end
end
