# Classsifier application

Classifier let ability to create several catalogs with unlimited levels
aimed support to fast get group of document every levels.

## Key features

- Postgres fields type ltree is used for paths storage
- Javascript is not used for add and destroy views fields
- Rails Turbo and Turbo Frames is used for dynamicaly operate with
  levels

## Software used

- ruby 3.1.2
- rails 7.0.4
- gem 'pg_ltree'
- bulma css
- gem 'pg'

## Description

Classsifier let create classifiers. 😀 Apps main view let ability to
create, update and destroy any classifiers level. Gem pg_ltree let
opportunity to set how levels can be updated and destroyed.

### Methods

All methods described in pg_ltree

- :height,
- :ancestors,
- :cascade_update,
- :cascade_destroy,
- :children,
- :root,
- :ltree_path_column,
- :parent,
- :leaves,
- :depth,
- :root?,
- :ltree_scope,
- :ltree_path,
- :ltree_path_before_last_save,
- :ltree_path_in_database,
- :self_and_descendants,
- :leaf?,
- :self_and_ancestors,
- :self_and_siblings,
- :siblings,
- :descendants

## Install

- git clone
- bundle install
- rails db:create db:migrate
- rails s
