class Template < ApplicationRecord
  belongs_to :user
  has_many :employees

  accepts_nested_attributes_for :employees
end
