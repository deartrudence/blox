class CreateWebLayouts < ActiveRecord::Migration
  def change
    create_table :web_layouts do |t|
      t.references :bloc, index: true
      t.references :webpage, index: true
      t.integer :position

      t.timestamps
    end
  end
end
