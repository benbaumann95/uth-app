class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :trackable, :validatable

  has_many :tickets
  has_many :bookings
  has_many :watchlists

  validates :email, format: { with: Devise.email_regexp, message: "invalid email" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  mount_uploader :photo, PhotoUploader
  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
