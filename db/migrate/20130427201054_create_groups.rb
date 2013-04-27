class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.user{} :users
      t.int :admin_key
      t.message{} :messages
      t.string :location

      t.timestamps
    end
  end
end
