class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.string :from
      t.string :to
      t.string :associated_images

      t.timestamps
    end
  end
end
