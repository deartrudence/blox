class CreateWebpages < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
      t.string :name
      t.integer :bloc_id, :array => true

      t.timestamps
    end
  end
end
