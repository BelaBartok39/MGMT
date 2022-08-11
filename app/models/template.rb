class Template < ApplicationRecord

  belongs_to :user
  has_many :employees

  broadcasts_to ->(template) { [template, "templates"] }, inserts_by: :prepend
end
