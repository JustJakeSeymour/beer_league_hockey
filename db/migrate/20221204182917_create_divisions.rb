class CreateDivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :divisions do |t|
      t.string :name
      t.integer :difficulty
      t.boolean :weekends

      t.timestamps
    end
  end
end
