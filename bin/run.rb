require_relative '../config/environment'
require 'tty-prompt'
require'pry'


def welcome
	this_shelter = Owner.all.find_by(kind: "Shelter")
	puts "Welcome to #{this_shelter.name}"
end


def reason_for_visit?
	prompt = TTY::Prompt.new
		reason = prompt.select("How can we help you today?") do |prompt|
			prompt.choice "I'm here to adopt.", "adopt"
			prompt.choice "I have an animal to surrender.", "surrender"
		end
		reason == "adopt" ? here_to_adopt_pet : here_to_surrender_pet
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


def here_to_adopt_pet
	prompt = TTY::Prompt.new
		email_address = prompt.ask('"Great! First, what is your email?') { |q| q.validate :email }
	adoptee = Owner.find_or_create_by({email: email_address, kind: "Person"})
	find_or_create_adoptee(adoptee)
	adoption_type
end


def find_or_create_adoptee(adoptee)
    if adoptee.name #Adoptee is known if they have a name
        greet_known_adoptee(adoptee)
    else #Adoptee is not known if no name found
        build_new_adoptee(adoptee)
    end
end


def build_new_adoptee(adoptee)
	name = prompt.ask("Hey, you're new here! What's your name?", required: true)
	adoptee.name = name
	adoptee.save
end


def greet_known_adoptee(adoptee)
	puts "Hi, #{adoptee.name}! Good to see you again."
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
	get_animals(animal_search).each_with_index do |pet_owner, index|
		pets << list_animals(pet_owner, index)
	end

	#show all pets from search
	animal_select(pets)
end


def animal_select(pets)
	prompt = TTY::Prompt.new
	header = "Available Pets:"
	pet_selection = prompt.select(header, pets)
end


def list_animals(pet_owner, index)
	# Choose a pet to see bio and have the option to adopt
		# Have an option to go back to list
		# emoji = ""
		# 	if pet_owner.pet.species == "feline"
		# 			emoji = "🐱"
		# 	elsif pet_owner.pet.species == "canine"
		# 			emoji = "🐶"
		# 	elsif pet_owner.pet.species == "n. hollandicus"
		# 			emoji = "🐥"
		# end
		#"#{pet_owner.pet.species.capitalize} ##{index+1}: #{pet_owner.pet.name}, a #{pet_owner.pet.color} #{pet_owner.pet.age}-year-old #{pet_owner.pet.gender} #{pet_owner.pet.breed.capitalize}"
	#"#{emoji} #{pet_owner.pet.name.capitalize}, a #{pet_owner.pet.color} #{pet_owner.pet.age}-year-old #{pet_owner.pet.gender} #{pet_owner.pet.breed.capitalize}"
	pet_owner.pet
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


def runner
    welcome
    reason_for_visit?
end

#binding.pry
#welcome
#adoption_type
runner
