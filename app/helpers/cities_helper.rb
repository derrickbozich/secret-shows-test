module CitiesHelper
  def city(city)
    @city = City.find_by(:name => city)
    if @city
      city_path(@city)
    else
      return
    end
  end

  
end
