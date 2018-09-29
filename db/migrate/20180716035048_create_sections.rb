class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :subject_id
      t.string :name

      t.timestamps
    end
  end
end
