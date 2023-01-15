class Catalog < ApplicationRecord
  ltree :path

  validates :path, presence: true,
                   format: { with: /\A[A-Za-zА-Яа-я._0-9]*\z/i,
                             message: I18n.t('activerecord.errors.models.catalog.attributes.path.format') }
  validates :path, uniqueness: true, if: :valid_format?

  private

  def valid_format?
    /\A[A-Za-zА-Яа-я._0-9]*\z/.match? path
  end
end
