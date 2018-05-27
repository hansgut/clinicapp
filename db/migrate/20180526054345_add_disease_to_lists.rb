class AddDiseaseToLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :lists, :disease, foreign_key: true
  end
end
