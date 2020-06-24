# PHASE 2
def convert_to_int(str)
  begin 
    Integer(str)
  rescue ArgumentError => err
    p err
    nil
  end
end

class CoffeeError < StandardError; end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise CoffeeError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => err
    p err
    p "I like coffee, i don't like your last try. Want another?"
    maybe_coffee = gets.chomp

    if maybe_coffee == "coffee"
      retry
    end
  end
end  

PHASE 4

class NewFriendError < StandardError; end
class NoNameError < StandardError; end
class NoPastTimeError < StandardError; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    
    
    begin 
      @name = name
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
      raise NewFriendError if @yrs_known < 5
      raise NoNameError if @name == ""
      raise NoPastTimeError if @fav_pastime == ""
    rescue NewFriendError 
      
      puts "#{@name} can't be best friends. Best friends must be known for at least 5 years."
    rescue NoNameError
      puts "Please enter a name for this 'friend'"
    rescue NoPastTimeError
      puts "Please enter a pasttime (no boring friends)"
    end

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


