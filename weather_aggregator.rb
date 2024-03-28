require 'httparty'
require 'json'

def fetch_weather_data(city)
    api_key = '458905a068f5038c7a5592494f2f7c80'
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}"
    response = HTTParty.get(url)
  
    if response.success?
        weather = response.parsed_response
        temperature_fahrenheit = (weather['main']['temp'] - 273.15) * 9/5 + 32
        humidity = weather['main']['humidity']
        conditions = weather['weather'].first['description']
        
        puts "#{city} ,Temperature: #{temperature_fahrenheit.round(2)}F, Humidity: #{humidity}%, Weather conditions: #{conditions}"
    else
        puts "Failed to fetch weather data for #{city}."
    end
end

fetch_weather_data('Memphis')
fetch_weather_data('Los Angeles')
fetch_weather_data('New York')