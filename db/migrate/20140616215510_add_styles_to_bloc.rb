class AddStylesToBloc < ActiveRecord::Migration
  def change
    add_column :blocs, :styles, :text
  end
end
