require 'rails_helper'

RSpec.describe Catalog do
  context 'when path valid' do
    let(:catalog) { described_class.new(path: 'Test_Catalog') }

    it 'is expected to be valid' do
      expect(catalog).to be_valid
    end
  end

  context 'when path have wrong symbols' do
    let(:catalog) { described_class.create(path: 'Test?Catalog') }

    it 'is expected to be invalid' do
      expect(catalog.errors.messages[:path]).to eq [I18n.t('activerecord.errors.models.catalog.attributes.path.format')]
    end
  end

  context 'when path already used' do
    it 'is expected to be invalid' do
      described_class.create(path: 'Test_Catalog')
      catalog = described_class.create(path: 'Test_Catalog')
      expect(catalog.errors.messages[:path]).to eq [I18n.t('activerecord.errors.models.catalog.attributes.path.taken')]
    end
  end
end
