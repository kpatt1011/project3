class AddMessagesReleasedToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :messages_released, :boolean
  end
end
