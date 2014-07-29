class CreateKpts < ActiveRecord::Migration
  def change
    create_table :kpts do |t|
      t.string :title

      t.timestamps
    end
  end
end
