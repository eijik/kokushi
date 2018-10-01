class CreateQs < ActiveRecord::Migration[5.2]
  def change
    create_table :qs do |t|
      t.integer :qn_id
      t.string :name
      t.boolean :correct_flg, default: false, null: false
      t.timestamps
    end
  end
end
