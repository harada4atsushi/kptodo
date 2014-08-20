class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :user_id, null: false 
      t.string :provider, null: false
      t.string :access_token, null: false

      t.timestamps
    end
  end
end
