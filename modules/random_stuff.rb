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

      command :roll do |event, *args|
        die = args.join.match(/d(\d+)/) || ['d6','6']
        "rolling a #{die[0]}: #{(rand die[1].to_i) + 1}"
      end 

      command :decide do |event, *args|
        if args.include?('or')
          args.join(' ').split('or').sample
        else
          args.sample
        end
      end

    end
  end
end
