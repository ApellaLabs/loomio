class CreateSmiles < ActiveRecord::Migration
  def change
    create_table :smiles do |t|
      t.integer :user_id
      t.integer :pro_con_id

      t.timestamps
    end
  end
end
