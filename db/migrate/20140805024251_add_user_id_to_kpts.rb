class AddUserIdToKpts < ActiveRecord::Migration
  def change
    add_column :kpts, :user_id, :integer, null: false
  end
end