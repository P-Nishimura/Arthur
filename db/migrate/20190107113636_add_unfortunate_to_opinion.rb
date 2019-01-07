class AddUnfortunateToOpinion < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :unfortunate, :boolean, default: true, null: false
  end
end
