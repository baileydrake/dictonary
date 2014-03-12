require './lib/Term'

def main_menu
  system("clear")
  puts "\n"
  puts "          MAIN MENU          "
  puts " * * * * * * * * * * * * * * "
  puts " *    'a' to add a word    * "
  puts " *    'l' to list words    * "
  puts " * 'f' to search for words * "
  puts " *      'x' to exit        * "
  puts " * * * * * * * * * * * * * * "
  user_input = gets.chomp
  case user_input
  when 'a'
    add_word
  when 'l'
    list_word_menu
  when 'f'
    find_word
  when 'x'
    exit
  else
    puts "You're dumb! Read the appropriate commands"
  end
end

def add_word
  puts "Enter New Word: "
  user_term = gets.chomp
  puts "Enter Definition: "
  user_definition = gets.chomp
  new_term = Term.create(user_term, user_definition)
  puts "Success! Dictionary updated."
  puts "Press 'a' to add another word, 'm' to modify a word or 'b' to go back to main menu"
  user_input = gets.chomp
  case user_input
  when 'a'
    add_word
  when 'm'
    list_word_menu
  when 'b'
    main_menu
  else
    puts "Sorry!! Try again."
  end
end

def list_word_menu
  puts "Current Words:"
  list_words
  puts "Select the word number to modify word"
  puts "Press 'd' to delete a word or press 'x' to go back"
  user_input = gets.chomp
  if user_input == 'x'
    main_menu
  elsif user_input == 'd'
    delete_word(Term.words[user_input.to_i-1])
  elsif user_input.to_i.to_s == user_input
    word_screen(Term.words[user_input.to_i-1])
  else
    puts "Invalid input!"
    list_word_menu
  end
end

def list_words
  Term.words.each_with_index do |word, index|
    puts "#{index+1}: #{word.term}"
  end
end

def list_definition(current_object)
  current_object.definition_list.each_with_index do |definition, index|
      puts "#{index+1}: #{definition}"
  end
end

def list_translations(current_object)
  current_object.term_list.each_with_index do |translation, index|
      puts "#{index+1}: #{translation}"
  end
end

def delete_word(current_object)
  list_words
  puts "Which word would you like to delete?"
  user_input = gets.chomp
  current_object.delete(user_input)
  puts "Goodbye word."
  list_word_menu
end

def word_screen(current_object)
  list_translations(current_object)
  list_definition(current_object)
  puts "* * * * * * * * * * * * * * * * *"
  puts "CURRENT WORD:     #{current_object.term} "
  puts "* * * * * * * * * * * * * * * * *"
  puts "*  'm' to modify a definition   *"
  puts "*  'd' to delete a definition   *"
  puts "*    'a' to add a definition    *"
  puts "*  't' to add a translation     *"
  puts "*  'dt' to delete translation   *"
  puts "*  'mt' to modify translation   *"
  puts "*        'x' to go back         *"
  puts "* * * * * * * * * * * * * * * * *"

  user_input = gets.chomp
  case user_input
  when 'm'
    mod_def(current_object)
  when 'd'
    delete_def(current_object)
  when 'a'
    add_def(current_object)
  when 't'
    add_translation(current_object)
  when 'dt'
    delete_translation(current_object)
  when 'mt'
    modify_translation(current_object)
  when 'x'
    list_word_menu
  else
    puts "Wrong Entry"
    word_screen(current_object)
  end
end

def add_def(current_object)
  puts "Enter Definition: "
  user_definition = gets.chomp
  current_object.add_definition(user_definition)
  puts "Definition Added!!"
  word_screen(current_object)
end

def mod_def(current_object)
  puts "Which definition would you like to change?"
  list_definition(current_object)
  user_index = gets.chomp
  puts "What would you like to change it to?"
  user_def = gets.chomp
  current_object.modify_definition(user_index, user_def)
  puts "Successsssss! Go USA!"
  word_screen(current_object)
end

def delete_def(current_object)
  puts "which definiton do you want to delete?"
  list_definition(current_object)
  user_input = gets.chomp
  current_object.delete_def(user_input)
  word_screen(current_object)
end

def find_word
  puts "What word are you looking for?"
  user_input = gets.chomp
  system("clear")
  if (Term.search(user_input) != "")
    word_screen(Term.search(user_input)[0])
  else
    puts "Word not found."
  end
end

def add_translation(current_object)
  puts "Enter Translation for Word: "
  user_translate = gets.chomp
  current_object.add_translation(user_translate)
  puts "Translation Added!!"
  word_screen(current_object)
end

def delete_translation(current_object)
  puts "which translation do you want to delete?"
  list_translations(current_object)
  user_input = gets.chomp
  current_object.delete_translation(user_input)
  word_screen(current_object)
end

def modify_translation(current_object)
  puts "Which translation would you like to change?"
  list_translations(current_object)
  user_index = gets.chomp
  puts "What would you like to change it to?"
  user_translation = gets.chomp
  current_object.modify_translation(user_index, user_translation)
  puts "Successsssss! Go USA!"
  word_screen(current_object)
end
main_menu
