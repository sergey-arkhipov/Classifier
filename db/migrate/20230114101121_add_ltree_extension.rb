class AddLtreeExtension < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'ltree'
  end
end
