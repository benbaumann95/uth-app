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
  validates :date_and_time, presence: true

  include AlgoliaSearch

  algoliasearch do
    attribute :name, :location
    searchableAttributes ['name']
  end

  index = Algolia::Index.new('events')
end
