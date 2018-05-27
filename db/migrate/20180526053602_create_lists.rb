class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.boolean :is_female
      t.integer :age
      t.datetime :date_start
      t.string :label
      t.string :work
      t.datetime :date_finish
      t.boolean :is_close
      t.string :conclusion

      t.timestamps
    end
  end
end
