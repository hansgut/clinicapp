class List < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  belongs_to :disease
  has_many :heals, dependent: :destroy
  validates :date_start, presence: true
  validates :date_finish, presence: true
  before_create do
    self.age = (DateTime.now.to_date - self.user.date_of_birth.to_date).to_i/365
    self.is_female = self.user.is_female
  end
end
