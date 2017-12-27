require 'discordrb'

require './modules/main.rb'


bot =  Discordrb::Commands::CommandBot.new token: ENV['bot_token'], client_id: ENV['client_id'], prefix: '~'

bot.message(contains: /\byoshiko\b/i) do |event|
  lines = [
	'*It\'s Yo-ha-ne!*',
	'Yohane!'
  ]
  event.respond lines.sample
end

bot.command :invite_url do
  bot.invite_url
end


bot.run
