class CreateFrowns < ActiveRecord::Migration
  def change
    create_table :frowns do |t|
      t.integer :user_id
      t.integer :pro_con_id
      t.timestamps
    end
  end
end
