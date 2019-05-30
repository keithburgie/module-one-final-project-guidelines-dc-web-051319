require_relative '../config/environment'
require 'tty-prompt'
require'pry'

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
    adoption_type
end

def adoption_type
    animal_type
end

def greet_adoptee
    puts "Great! First, what is your email address?"
end

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
end

def greet_known_adoptee(adoptee)
    puts "Hi, #{adoptee.name}! Good to see you again."
end

def animal_type
  prompt = TTY::Prompt.new
  animal_type_select = "What type of animal are you looking for?"
  choices = ["Search for cats", "Search for dogs", "Search other", "All pets"]
  select_animal_kind = prompt.select(animal_type_select, choices)

  if select_animal_kind == choices[0] #cats
    pets = []
    get_animals("feline").each_with_index {|pet_owner, index| pets << list_animals(pet_owner, index)}
    animal_select(pets)

  elsif select_animal_kind == choices[1] #dogs
    pets = []
    get_animals("canine").each_with_index {|pet_owner, index| pets << list_animals(pet_owner, index)}
    animal_select(pets)

  elsif select_animal_kind == choices[2] #other
    pets = []
    get_animals("other").each_with_index {|pet_owner, index| pets << list_animals(pet_owner, index)}
    animal_select(pets)

  else #show all pets
    pets = []
    get_animals("all").each_with_index {|pet_owner, index| pets << list_animals(pet_owner, index)}
    animal_select(pets)
  end
end

def list_animals(pet_owner, index)
    # Choose a pet to see bio and have the option to adopt
    # Have an option to go back to list
    emoji = ""
    if pet_owner.pet.species == "feline"
        emoji = "🐱"
    elsif pet_owner.pet.species == "canine"
        emoji = "🐶"
    elsif pet_owner.pet.species == "n. hollandicus"
        emoji = "🐥"
    end

    animal(pet_owner)
    
end

def animal(pet_owner)
    description = "#{pet_owner.pet.name.capitalize}, a #{pet_owner.pet.color} #{pet_owner.pet.age}-year-old #{pet_owner.pet.gender} #{pet_owner.pet.breed.capitalize}"
    return pet_owner.pet
end

def animal_select(pets)
    prompt = TTY::Prompt.new
    header = "Available Pets:"
    pet_selection = prompt.select(header, pets)
    binding.pry
end



#################################################################################
def shelter_animals #checking if the animal have the shelter as owner
    pets_shelter = PetOwner.all.select do |pet_owner|
        if pet_owner.owner.kind == "Shelter"
            pet_owner
        end
    end
end

def get_animals(pet_species)
    if pet_species == "feline"
        shelter_animals.select do |pet_owner|
            #show felines
            pet_owner.pet.species == "feline"
        end
    elsif pet_species == "canine"
        shelter_animals.select do |pet_owner|
            #show canines
            pet_owner.pet.species == "canine"
        end
    elsif pet_species == "other"
        shelter_animals.select do |pet_owner|
            #show pets besides felines or canines
            pet_owner.pet.species != "feline" && pet_owner.pet.species != "canine"
        end
    else
        shelter_animals.select do |pet_owner|
            #show all available pets
            pet_owner.pet
        end
    end
end

#binding.pry
welcome
#animal_type
