class AddOpenOrCloseToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :open_or_close?, :boolean, default: true, null: false
  end
end
