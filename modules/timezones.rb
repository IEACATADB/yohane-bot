require 'tzinfo'

module Bot
  module DiscordCommands
    module TimeZones
      extend Discordrb::Commands::CommandContainer



      command :timezone do |event, *args|
        begin 
            tz =  TZInfo::Timezone.get args.first
        
            output = case args[1]
              when 'now'
                tz.now
              else 
                'Invalid argument'
            end

        rescue
          output = 'Invalid Timezone'
        end

          output
      end

    end
  end
end