class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.text :content
      t.integer :user_id
      t.integer :topics_id

      t.timestamps
    end
  end
end
