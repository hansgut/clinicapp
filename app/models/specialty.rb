class Specialty < ApplicationRecord
  has_many :doctors
  validates :title, presence: true
end
