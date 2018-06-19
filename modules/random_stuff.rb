module Bot
  module DiscordCommands
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
        if args.map(&:upcase).include?('OR')
          args.join(' ').split(/\sor\s/i).sample
        else
          args.sample
        end
      end

      command :'8ball' do 
        answers = ['It is certain.', 'It is decidedly so.', 'Without a doubt.', 'Yes - definitely.',
  'You may rely on it.', 'As I see it, yes.', 'Most likely.', 'Outlook good.', 'Yes.',
  'Signs point to yes.',  'Reply hazy, try again',  'Ask again later.',  'Better not tell you now.',
  'Cannot predict now.',  'Concentrate and ask again.',  'Don\'t count on it.',  'My reply is no.',
  'My sources say no',  'Outlook not so good.',  'Very doubtful.']
      
        "*#{answers.sample}*"
      end

    end
  end
end

