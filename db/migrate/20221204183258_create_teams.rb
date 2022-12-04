class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :won
      t.integer :lost
      t.integer :shootout_loss
      t.boolean :active_team

      t.references :division, foreign_key: true

      t.timestamps
    end
  end
end
