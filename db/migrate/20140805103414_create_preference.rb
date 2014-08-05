class CreatePreference < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :user_id, null: false 
      t.string :todoist_api_token

      t.timestamps
    end
  end
end
