class AddSenderToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sender, :integer
  end
end
