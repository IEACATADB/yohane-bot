require 'discordrb'

require './modules/main.rb'

prefix = '†'

bot = Discordrb::Bot.new token: ENV['bot_token'], client_id: ENV['client_id']

#probably a bad way to do this, but yey magic
def command name
  bot.message(content: "#{prefix+name}")
  event.respond yield
end 


bot.message(contains: /\byoshiko\b/i) do |event|
  lines = [
	'*It\'s Yo-ha-ne!*',
	'Yohane!'
  ]
  event.respond lines.sample
end


# command 'invite_url' do
#   bot.invite_url
# end
bot.message(content: "#{prefix+'invite_url'}") do |event|
  event.respond bot.invite_url
end

bot.run
