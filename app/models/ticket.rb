class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
