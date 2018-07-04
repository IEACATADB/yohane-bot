module Bot
    module DiscordCommands
        module Misc
            extend Discordrb::Commands::CommandContainer

            command :shrug do 
                '¯\_(ツ)_/¯'
            end

            command :scream do
                'a' * (rand 10..60)
            end

            command :log_to_console do |event, *args|
                puts args.join(' ')
            end 

            command :psa do |_event, *args|
                '📣' + args.map{|word|
                    word.downcase.tr('/a-z/','/🇦-🇿/').chars.join(' ')
                }.join(' ')

                # '📣' + args.first.downcase.tr('/a-z/','/🇦-🇿/').chars.join(' ')
               
            end
        end 
    end
end