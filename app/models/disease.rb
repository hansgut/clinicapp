class Disease < ApplicationRecord
has_many :lists

  def full_name
    code + ' - ' + title
  end
end
