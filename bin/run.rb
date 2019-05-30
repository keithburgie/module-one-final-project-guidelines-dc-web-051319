require_relative '../config/environment'
require 'tty-prompt'
require'pry'


def welcome
	this_shelter = Owner.all.find_by(kind: "Shelter")
	puts "Welcome to #{this_shelter.name}"
end

# def welcome(zip)
# 	this_shelter = Owner.all.find_by(kind: "Shelter", zip_code: zip)
# 	puts "Welcome to #{this_shelter.name}"
# end


def reason_for_visit?
	prompt = TTY::Prompt.new
	reason = prompt.select("How can we help you today?") do |prompt|
		prompt.choice "I'm here to adopt.", "adopt"
		prompt.choice "I have an animal to surrender.", "surrender"
	end
	reason == "adopt" ? here_to_adopt_pet : here_to_surrender_pet
end


def here_to_adopt_pet
	prompt = TTY::Prompt.new
	email_address = prompt.ask('"Great! First, what is your email?') { |q| q.validate :email }
	adoptee = Owner.find_or_create_by({email: email_address, kind: "Person"})
	find_or_create_adoptee(adoptee)
	adoption_type
end


def here_to_surrender_pet
	prompt = TTY::Prompt.new
	response = prompt.yes?("Sorry, we're full! Would you like a new pet instead?")
	if response == true 
		here_to_adopt_pet
	else 
		puts "Okay, goodbye!"
	end
end


def find_or_create_adoptee(adoptee)
	if adoptee.name
		# If adoptee has name, greet them
		greet_known_adoptee(adoptee)
	else
		# If adoptee does not have name, create them
		build_new_adoptee(adoptee)
	end
end


def greet_known_adoptee(adoptee)
	puts "Hi, #{adoptee.name}! Nice to see you again."
end

def build_new_adoptee(adoptee)
	name = prompt.ask("Hey, you're new here! What's your name?", required: true)
	adoptee.name = name
	adoptee.save
end


def adoption_type
  prompt = TTY::Prompt.new
	animal_search = prompt.select("What type of animal are you looking for?") do |prompt|
		prompt.choice "Search for cats.", "feline"
		prompt.choice "Search for dogs", "canine"
		prompt.choice "Search other animals", "other"
		prompt.choice "Search all animals", "all"
	end

	pets = []

	# Loop through animals available at this shelter
	get_animals(animal_search).each_with_index do |pet_owner, index|
		pet_obj = pet_owner.pet
		details = pet_info(pet_owner, index)
		# Add animal description and object to [pets]
		pets << {name: details, value: pet_obj}
	end
	# Show all pets from search
	pet_selector(pets)

end


def pet_info(pet_owner, index)
	pet = pet_owner.pet
	icon = ""
	if pet_owner.pet.species == "feline"
		icon = "🐱"
	elsif pet_owner.pet.species == "canine"
		icon = "🐶"
	elsif pet_owner.pet.species == "n. hollandicus"
		icon = "🐥"
	end
	"#{icon} #{pet.name.capitalize}, a #{pet.color} #{pet.age}-year-old #{pet.gender} #{pet.breed.capitalize}"
end


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

def pet_selector(pets)
	prompt = TTY::Prompt.new
	pet_selection = prompt.select("Available Pets:", pets)
	get_the_selected_pet(pet_selection)
end

def get_the_selected_pet(pet_selection)
		pet_selection
		binding.pry
  	prompt = TTY::Prompt.new
      response = prompt.yes?("Adopt this pet?")
    if response == true
      #puts "Aggree with the contract"
    resposta_adoption_sim
    else
    adoption_type
    end
end

def resposta_adoption_sim
  prompt = TTY::Prompt.new
  contract_agreement = prompt.yes?('Agree with the contract') do |q|
    q.suffix 'Agree/Disagree'
    q.positive 'Agree'
    q.negative 'Disagree'
    q.convert -> (input) { !input.match(/^agree$/i).nil? }
  end
  if contract_agreement == true
    puts "muito bom"
    adopting_pet
  else
    adoption_type
  end
end

def adopting_pet#owner/pet
  animal_select = pet_selection
  pet_selection.each do |pet|
    pet.owner
    #owner = find_or_create_adoptee
    # binding.pry
    #Pet.update
  end
end


def runner
    welcome
    reason_for_visit?
end

#binding.pry
#welcome
#adoption_type
runner
