class User < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :documents

  scope :without_admin, -> { where(admin: false) }
end
