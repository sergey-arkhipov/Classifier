# Создание классификатора

- rails new classifier -T -d postgresql
- rails generate rspec:install
- rails g migration AddLtreeExtension

```ruby
class AddLtreeExtension < ActiveRecord::Migration
  def change
    enable_extension 'ltree'
  end
end
```

- rails db:create
- rails db:migrate
- rails g model Catalog  path:ltree:index

```ruby
class CreateCatalogs < ActiveRecord::Migration[7.0]
  def change
    create_table :catalogs do |t|
      t.ltree :path

      t.timestamps
    end
    add_index :catalogs, :path, using: :gist
  end
end
```

```console
>> Catalog.instance_methods(false)
=> 
[:leaves,
 :height,
 :ancestors,
 :ltree_scope,
 :ltree_path,
 :ltree_path_before_last_save,
 :ltree_path_in_database,
 :self_and_descendants,
 :root,
 :leaf?,
 :self_and_ancestors,
 :self_and_siblings,
 :parent,
 :depth,
 :root?,
 :children,
 :siblings,
 :cascade_update,
 :cascade_destroy,
 :ltree_path_column,
 :descendants]
```

- rails g controller Cataloges
