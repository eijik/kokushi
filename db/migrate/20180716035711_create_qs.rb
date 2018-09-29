class CreateQs < ActiveRecord::Migration[5.2]
  def change
    create_table :qs do |t|
      t.integer :qn_id
      t.string :name

      t.timestamps
    end
  end
end
