class Catalog < ApplicationRecord
  ltree :path
  validates :path, presence: true,
    format: { with: /\A[\w_\.]*\z/i,
                             message: I18n.t('activerecord.errors.models.catalog.attributes.path.format') }
end
