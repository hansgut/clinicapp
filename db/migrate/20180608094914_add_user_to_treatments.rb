class AddUserToTreatments < ActiveRecord::Migration[5.1]
  def change
    add_reference :treatments, :user, foreign_key: true
  end
end
