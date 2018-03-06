class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :price, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
