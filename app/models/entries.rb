# coding: utf-8

class Entries < Sequel::Model
  unless table_exists?
    set_schema do
      primary_key :id
      String :text
      DateTime :created_at
    end
    create_table
  end
end
