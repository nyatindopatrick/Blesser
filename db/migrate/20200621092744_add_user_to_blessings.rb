class AddUserToBlessings < ActiveRecord::Migration[6.0]
  def change
    add_column :blessings, :user_id, :integer
  end
end
