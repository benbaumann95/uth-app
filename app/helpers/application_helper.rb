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
      when "London" then 'club-pic'
      when "Bristol" then 'club-rave-pic'
      when nil then 'festival-sitting-down'
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
