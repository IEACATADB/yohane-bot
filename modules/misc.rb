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

        end
    end
end