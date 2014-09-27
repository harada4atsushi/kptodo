class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :user_id
      t.string :code
      t.string :name
    end
  end
end
