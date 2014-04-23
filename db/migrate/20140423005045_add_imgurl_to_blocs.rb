class AddImgurlToBlocs < ActiveRecord::Migration
  def change
    add_column :blocs, :img_url, :string
  end
end
