class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :handle
      t.string :company
      t.text :bio
      t.string :website
      t.references :user, index: true

      t.timestamps
    end
  end
end
