class CreateTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :treatments do |t|
      t.references :disease, foreign_key: true
      t.text :complaints

      t.timestamps
    end
  end
end
