module Bot
  module DiscordCommands
    module Math
      extend Discordrb::Commands::CommandContainer

      @symbols = /[%+\-*\/^]|[*]{2}/
      @regex = /\(?(\d+)\s?(#{@symbols})\s?(\d+)\)?/x
    
      def self.math input 
        pass = input.gsub(@regex) {|statement| calculate statement}
        pass =~ @symbols ? math(pass) : pass
      end 
    
      def self.calculate statement
        statement.gsub(@regex){|match| $1.to_f.send("#{$2}",$3.to_f)}
      end

      command :math do |e,*args|
        math args.join
      end

    end
  end
end