class CreateQns < ActiveRecord::Migration[5.2]
  def change
    create_table :qns do |t|
      t.integer :section_id
      t.string :name
      t.string :description
      t.integer :correct_q_id
      t.integer :user_id
      t.string :from

      t.timestamps
    end
  end
end
