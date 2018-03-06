class Event < ApplicationRecord
  has_many :tickets
  accepts_nested_attributes_for :tickets

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
