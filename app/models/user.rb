class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :airplanes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :airplanes, dependent: :destroy
end
