class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
  :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name
  has_noticed_notifications

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :services
  has_many :staff_dates
  has_many :templates
end
