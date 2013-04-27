class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :is_admin
      t.int :key
      t.string :group

      t.timestamps
    end
  end
end
