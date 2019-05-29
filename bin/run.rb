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
    if reason == choices[0]
        adopt_pets
    elsif reason == choices[1]
        surrender_pets
    end
end

def surrender_pets
    puts "Sorry, we're full!"
    #reason_for_visit
end

def adopt_pets
    greet_adoptee
    email_address = collect_adoptee_info
    adoptee = Owner.find_or_create_by({email: email_address, kind: "Person"})
end

def greet_adoptee
    puts "Great! First, what is your email address?"
end

def collect_adoptee_info
    gets.chomp
end

adopt_pets
