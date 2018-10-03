class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.integer :level

      t.timestamps
    end
  end
end
