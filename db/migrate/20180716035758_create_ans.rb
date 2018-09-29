class CreateAns < ActiveRecord::Migration[5.2]
  def change
    create_table :ans do |t|
      t.integer :user_id
      t.integer :qn_id
      t.integer :q_id
      t.boolean :correct_flg

      t.timestamps
    end
  end
end