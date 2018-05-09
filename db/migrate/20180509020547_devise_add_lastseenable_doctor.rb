class DeviseAddLastseenableDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :last_seen, :datetime
  end
end
