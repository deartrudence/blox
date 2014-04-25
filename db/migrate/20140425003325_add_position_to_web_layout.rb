class AddPositionToWebLayout < ActiveRecord::Migration
  def change
    add_column :web_layouts, :position, :integer
  end
end
