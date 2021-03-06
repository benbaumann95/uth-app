class Event < ApplicationRecord
  has_many :tickets
  accepts_nested_attributes_for :tickets

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
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
  validates_uniqueness_of :name, scope: [:date_and_time, :address], message: "An event already exists for this date and venue."

  include AlgoliaSearch

  algoliasearch do
    attribute :name, :city, :category
    searchableAttributes ['name', 'city', 'category']
    ranking ['asc(date_and_time)']
  end

   def photo_file
    case self.category
      when "Club night" then 'club_pic'
      when "Concert" then 'club-rave-pic'
      when "Festival" then 'festival-sitting-down'
      when "Travel" then 'travel-pic'
      when "Sport" then 'sports-rugby'
      when "Society" then 'electronics'
      when "Socials" then 'prosecco-ball'
    end
  end
end
