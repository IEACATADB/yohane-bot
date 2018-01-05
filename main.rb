require 'discordrb'

module Bot
 
  bot =  Discordrb::Commands::CommandBot.new token: ENV['bot_token'], client_id: ENV['client_id'], prefix: '~'

  Dir['modules/*.rb'].each {|mod| load mod}

  module DiscordCommands; end

  DiscordCommands.constants.each do |mod|
    bot.include! DiscordCommands.const_get mod
  end

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

end