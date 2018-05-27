class List < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  has_many :heals
  before_create do
    self.age = (DateTime.now.to_date - self.user.date_of_birth.to_date).to_i/365
    self.is_female = self.user.is_female
  end
end
