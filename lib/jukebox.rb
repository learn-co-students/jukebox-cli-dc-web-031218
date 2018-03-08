require 'pry'

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

# def say_hello(name)
#   "Hi #{name}!"
# end
#
# puts "Enter you name:"
# users_name = gets.chomp
#
# puts say_hello(users_name)


def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index{|item, index| puts "#{index + 1}. #{item}"}
end

def play (songs)

  puts "Please enter a song name or number:"
  users_response = gets.chomp
  # binding.pry
  if songs.any? {|song| song.upcase == users_response.upcase} || users_response == 1..songs.length
    # binding.pry
    # if users_response.to_i <= songs.length
    #   users_response = users_response.to_i
    # end
    if users_response.is_a?(String)
      puts "Playing #{users_response}"
    else
      puts "Playing #{songs[users_response.to_i - 1]}"
    end
  elsif users_response.to_i <= songs.length && 0 < users_response.to_i
    puts "Playing #{songs[users_response.to_i - 1]}"
  else
    puts "Invalid input, please try again."
  end

end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  puts "Please enter a command:"
  user_input = gets.chomp
  while user_input.upcase != 'EXIT'
    if user_input.upcase == 'LIST'
      list(songs)
      user_input = gets.chomp
    elsif user_input.upcase == 'PLAY'
      play(songs)
    elsif user_input.upcase == 'HELP'
      help
      user_input = gets.chomp
    else
      puts "Invalid input"
      user_input = gets.chomp
    end
  end
  exit_jukebox
end
