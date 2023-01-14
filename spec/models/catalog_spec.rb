require 'rails_helper'

RSpec.describe Catalog do
  context 'when path valid' do
    let(:path) { described_class.new(path: 'Test_Catalog') }

    it 'is expected to be valid' do
      expect(path).to be_valid
    end
  end

  context 'when path invalid' do
    let(:path) { described_class.new(path: 'Test Catalog') }

    it 'is expected to be invalid' do
      expect(path).to be_invalid
    end
  end
end
