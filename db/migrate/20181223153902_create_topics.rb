class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :detail
      t.integer :user_id
      t.boolean :open_or_close?

      t.timestamps
    end
  end
end
