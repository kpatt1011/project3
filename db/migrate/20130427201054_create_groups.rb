class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :admin_key
      t.string :location

      t.timestamps
    end
  end
end
