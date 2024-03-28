require 'httparty'
require 'json'

def conversion_tool(amount, current_currency, target_currency)
  api_key = 'ef93bdfc71bd32173d15290d'
  url = "https://v6.exchangerate-api.com/v6/#{api_key}/latest/#{current_currency}"
  response = HTTParty.get(url)
  
  if response.success?
    response_body = JSON.parse(response.body)
    rates = response_body['conversion_rates']

    if rates
      exchange_rate = rates[target_currency]
      converted_amount = amount * exchange_rate
      puts "#{amount} #{current_currency} is #{converted_amount.round(2)} #{target_currency} at an exchange rate of #{exchange_rate}."
    end
  
  end
end


conversion_tool(50, 'USD', 'EUR')
conversion_tool(50, 'USD', 'GBP')
