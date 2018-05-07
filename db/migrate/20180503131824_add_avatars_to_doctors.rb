class AddAvatarsToDoctors < ActiveRecord::Migration[5.1]
  def self.up
    change_table :doctors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :doctors, :avatar
  end
end
