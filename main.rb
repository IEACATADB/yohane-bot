require 'discordrb'

include 'modules/main'


bot = Discordrb::Bot.new token: ENV['bot_token'], client_id: ENV['client_id']


puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'


bot.message(contains: /\byoshiko\b/i) do |event|
  event.respond 'Yohane!'
end


bot.run