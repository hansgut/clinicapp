class CreateHeals < ActiveRecord::Migration[5.1]
  def change
    create_table :heals do |t|
      t.string :content
      t.references :doctor, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
