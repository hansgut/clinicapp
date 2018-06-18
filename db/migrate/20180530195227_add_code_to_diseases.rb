class AddCodeToDiseases < ActiveRecord::Migration[5.1]
  def change
    add_column :diseases, :code, :string
  end
end
