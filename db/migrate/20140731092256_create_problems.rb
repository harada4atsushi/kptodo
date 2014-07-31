class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :kpt_id, null: false 
      t.string :content, null: false

      t.timestamps
    end
  end
end
