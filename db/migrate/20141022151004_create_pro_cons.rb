class CreateProCons < ActiveRecord::Migration
  def change
    create_table :pro_cons do |t|
      t.text :body, limit: 200
      t.boolean :cons
      t.integer :discussion_id

      t.timestamps
    end
  end
end
