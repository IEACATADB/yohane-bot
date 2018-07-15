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

        mutated = args.map do |word|
          word.match(/<\S*>/)? word :
          word.downcase.tr('/a-z/','/🇦-🇿/').chars.join(' ')
        end

        '📣' + mutated.join('🔵').gsub(/(<\S*>)🔵|🔵(<\S*>)/) {|i| i.tr('🔵',' ')}
      end
    end 
  end
end