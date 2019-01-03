class AddTopicIdToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :topic_id, :integer
  end
end
