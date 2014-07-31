class CreateTries < ActiveRecord::Migration
  def change
    create_table :tries do |t|
      t.integer :kpt_id, null: false 
      t.string :content, null: false

      t.timestamps
    end
  end
end
