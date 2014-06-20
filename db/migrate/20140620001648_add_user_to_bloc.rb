class AddUserToBloc < ActiveRecord::Migration
  def change
    add_reference :blocs, :user, index: true
  end
end
