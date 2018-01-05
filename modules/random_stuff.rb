module Bot
  module DiscordCommands
    # Commands to manage game creation and flow
    module Random
      extend Discordrb::Commands::CommandContainer

      command :random do |event,lim|
        return rand(100).round 2 if lim.nil? || lim.to_i.zero?
        
        if lim.to_f == lim.to_i
          rand lim.to_i
        else 
          (rand lim.to_f).round 2
        end
      end

      command :coinflip do
        ['head','tails'].sample
      end 

      command :roll do 
        "rolling a d6: #{(rand 5) + 1}"
      end 

      command :decide do |event, *args|
        args.sample
      end

    end
  end
end
