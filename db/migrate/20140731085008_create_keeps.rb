class CreateKeeps < ActiveRecord::Migration
  def change
    create_table :keeps do |t|
      t.integer :kpt_id, null: false 
      t.string :content, null: false

      t.timestamps
    end
  end
end
