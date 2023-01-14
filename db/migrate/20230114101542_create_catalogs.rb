class CreateCatalogs < ActiveRecord::Migration[7.0]
  def change
    create_table :catalogs do |t|
      t.ltree :path

      t.timestamps
    end
    add_index :catalogs, :path, using: :gist
  end
end
