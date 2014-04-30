class AddUserIdToWebpages < ActiveRecord::Migration
  def change
    add_column :webpages, :user_id, :integer
  end
end
