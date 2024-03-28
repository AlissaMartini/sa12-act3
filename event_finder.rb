require 'httparty'
require 'json'

def fetch_events(city)
  api_key = 'VINamVGOqAnyFVi7Hlr0bLQ9zvsvL8gQ'
  url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=#{api_key}&city=#{city}"
  response = HTTParty.get(url)
  
  if response.success?
    parsed_response = JSON.parse(response.body)
    events = parsed_response['_embedded']['events'] || []

    events.each_with_index do |event, index|
      name = event['name'] || "Event Name not available"
      venue_name = event['_embedded']['venues'][0]['name'] || "N/A"
      date_time = event['dates']['start']['localDateTime'] || "N/A"
      date, time = date_time.split('x')
      
      puts "Name: #{name} - Venue: #{venue_name} - Date: #{date} - Time: #{time}"
    end
  else
    puts "Failed to fetch events for #{city}."
  end
end

fetch_events('Memphis')
