require 'rails_helper'

RSpec.describe 'Создание Catalog', js: true do
  before do
    visit catalogs_path
  end

  context 'когда введены корректные данные' do
    it 'ожидается создание' do
      fill_in :catalog_path, with: 'Test_path'
      click_on 'Create'
      expect(Catalog.count).to eq 1
    end
  end

  context 'когда данные не корректны' do
    let(:path_error) { I18n.t('activerecord.errors.models.catalog.attributes.path.format') }

    before do
      fill_in :catalog_path, with: 'Test path'
      click_on 'Create'
    end

    it 'ожидается получение ошибок' do
      expect(page).to have_text(path_error)
    end
  end

  context 'когда добавляем каталог/уровень' do
    it 'ожидается отображение в форме в поле вввода и создание ссылки' do
      fill_in :catalog_path, with: 'Test_path'
      click_on 'Create'
      expect(page).to have_text('Test_path', count: 1).and have_link('Test_path', count: 1).and \
        have_css('turbo-frame[id^=catalog_]')
    end

    it 'ожидается переход по ссылке на уровень и пустой список уровней' do
      fill_in :catalog_path, with: 'Test_path'
      click_on 'Create'
      click_on 'Test_path'
      expect(page).to have_text('Test_path', count: 1).and have_link('Test_path').and \
        have_no_css('turbo-frame[id^=catalog_]')
    end

    # rubocop:disable RSpec/MultipleExpectations
    it 'ожидается создание вложенного уровня без родительских уровней' do
      fill_in :catalog_path, with: 'Test_path.level_1.level_2'
      click_on 'Create'
      click_on 'Test_path'
      expect(page).to have_text('Test_path', count: 1).and have_link('Test_path.level_1.level_2').and \
        have_no_css('turbo-frame[id^=catalog_]')
      expect(Catalog.roots.to_a).to be_empty
    end

    # rubocop:enable RSpec/MultipleExpectations
    it 'ожидается отсутствие каталога, уровень не отображается' do
      fill_in :catalog_path, with: 'Test_path.level_1.level_2'
      click_on 'Create'
      click_on 'Test_path'
      visit catalogs_path
      expect(page).to have_no_text('Test_path').and have_no_link('Test_path.level_1.level_2').and \
        have_no_css('turbo-frame[id^=catalog_]')
    end
  end
end
