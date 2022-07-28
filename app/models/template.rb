class Template < ApplicationRecord
  has_many :staff_date_ids, dependent: :destroy
  belongs_to :user

end
