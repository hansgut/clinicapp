class Heal < ApplicationRecord
  belongs_to :doctor
  belongs_to :list
  validates :content, presence: true
end
