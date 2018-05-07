class AddFirstNameToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :patronymic, :string
    add_column :doctors, :is_female, :boolean, default: false
  end
end
