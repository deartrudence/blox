class CreateBlocs < ActiveRecord::Migration
  def change
    create_table :blocs do |t|
      t.string :name
      t.text :code
      t.string :category

      t.timestamps
    end
  end
end
