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

def help
  command_prompt_array = ["help : displays this help message",
  "list : displays a list of songs you can play",
  "play : lets you choose a song to play",
  "exit : exits this program"]

  puts "I accept the following commands:"

  command_prompt_array.each do |command_explanation|
    puts "- #{command_explanation}"
  end
end

def list(songs_array)

  counter = 0
  songs_array.each do |song|
    song_number = counter + 1
    puts "#{song_number}. #{song}"
    counter += 1
  end
end

def play(songs_array)
  puts "Enter # of song or song name: "
  puts "Example: 'Phoenix - 1901'"
  song_input = gets.chomp

  if song_input.to_i.class == Integer
    song_selection = song_input.to_i - 1
    if song_selection <= songs_array.length
      puts "Playing #{songs_array[song_selection]}"
    else
      puts "Invalid input, please try again"
    end
  else
    song_selection = song_input
    if songs_array.include?(song_selection)
      songs_array.each do |song|
        if song == song_selection
          puts "Playing #{song_selection}"
        end
      end
    else
      puts "Invalid input, please try again"
    end


  end
end

def exit_jukebox
  puts "Goodbye"
end



def run(songs)
  help
  puts "Please enter a command:"
  main_input = gets.chomp

  until main_input == "exit"
    case main_input
    when "help"
      help
      main_input = gets.chomp
    when "list"
      list(songs)
      main_input = gets.chomp
    when "play"
      play(songs)
      main_input = gets.chomp
    else
      puts "Invalid command."
      help
      puts "Please enter a command:"
      main_input = gets.chomp
    end #case end

  end
exit_jukebox
end
