class AddCatidToBloc < ActiveRecord::Migration
  def change
    add_column :blocs, :category_id, :integer
  end
end
