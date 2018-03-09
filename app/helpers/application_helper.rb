module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def city_picture(name)
    case name
      when "London" then 'london'
      when "Bristol" then 'bristol'
      when 'Sheffield' then 'sheffield'
      when 'Leeds' then 'leeds'
      when 'Manchester' then 'manchester'
      when 'Edinburgh' then 'edinburgh'
      when 'Cardiff' then 'cardiff'
      when 'Leicester' then 'leicester'
      when 'Nottingham' then 'Nottingham'
      when nil then 'festival-sitting-down'
      else 'sports-rugby'
    end
  end

   def category_picture(name)
    case name
      when "Club night" then 'club-pic'
      when "Concert" then 'club-rave-pic'
      when "Festival" then 'festival-sitting-down'
      when "Travel" then 'travel-pic'
      when "Sport" then 'sports-rugby'
      when "Society" then 'society'
      when "Socials" then 'prosecco-ball'
    end
  end

end
