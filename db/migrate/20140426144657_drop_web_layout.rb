class DropWebLayout < ActiveRecord::Migration
  def change
  	drop_table :web_layouts
  end
end
