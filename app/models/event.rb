class Event < ApplicationRecord
  has_many :tickets

  validates :name, presence: true
  validates :location, presence: true
  validates :category, inclusion: { in: [
    "Club night",
    "Concert",
    "Festival",
    "Travel",
    "Sport",
    "Society",
    "Socials"
  ] }
  validates :date, presence: true
end
