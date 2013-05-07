class AddFounderUsernameToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :founder_username, :string
  end
end
