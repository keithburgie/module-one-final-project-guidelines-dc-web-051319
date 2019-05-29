require_relative '../config/environment'
require 'tty-prompt'

def welcome
    puts "Welcome to (Shelter Name)"
    reason_for_visit
    # What's your email address?
        # find or create user based on answer
            # if owner exists : move on to reason for visit
            # if owner does not exist : ask for more information and create new Owner from it
                # :name = name, :zip_code = zip_code, :kind = "Person"
end

def reason_for_visit
    prompt = TTY::Prompt.new
    greeting = "How can we help you today?"
    choices = ["I'm here to adopt.", "I have an animal to surrender."]
    reason = prompt.select(greeting, choices)
    if reason == choices[0] #adopt
        here_to_adopt_pet
    elsif reason == choices[1] #surrender
        here_to_surrender_pet
    end
end

def here_to_surrender_pet
    puts "Sorry, we're full!"
    #reason_for_visit
end

def here_to_adopt_pet
    greet_adoptee
    email_address = gets.chomp
    adoptee = Owner.find_or_create_by({email: email_address, kind: "Person"})
    find_or_create_adoptee(adoptee)
end

def adoption_type
    animal_type
end

def greet_adoptee
    puts "Great! First, what is your email address?"
end

def 

def collect_adoptee_info
    gets.chomp
end

def find_or_create_adoptee(adoptee)
    if adoptee.name #Adoptee known if they have a name
        greet_known_adoptee(adoptee)
    else #Adoptee is not known if no name found
        build_new_adoptee(adoptee)
    end
end

def build_new_adoptee(adoptee)
    puts "Hey, you're new here! What's your name?"
        name = gets.chomp
        adoptee.name = name
        adoptee.save
    puts "What's your zip code?"
        zip = gets.chomp
        adoptee.zip_code = zip
        adoptee.save
end

def greet_known_adoptee(adoptee)
    puts "Hi, #{adoptee.name}! Good to see you again."
end

binding.pry
here_to_adopt_pet
