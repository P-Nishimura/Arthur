class AddReasonToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reason, :text
  end
end
