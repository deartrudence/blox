class CreateBucketBlocs < ActiveRecord::Migration
  def change
    create_table :bucket_blocs do |t|
      t.references :user, index: true
      t.references :bloc, index: true

      t.timestamps
    end
  end
end
