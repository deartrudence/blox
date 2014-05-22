class AddColumn < ActiveRecord::Migration
  def change
  	add_attachment :blocs, :bloc_img
  end
end
