class AddLikesCountToBloc < ActiveRecord::Migration
  def change
    add_column :blocs, :likes_count, :integer

  end
end
