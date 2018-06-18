class AddDoctorToTreatments < ActiveRecord::Migration[5.1]
  def change
    add_reference :treatments, :doctor, foreign_key: true
  end
end
