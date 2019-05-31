require_relative '../config/environment'
require 'tty-prompt'
require'pry'

def welcome
	this_shelter = Owner.all.find_by(kind: "Shelter")
	puts "Welcome to #{this_shelter.name}"
end

# If we had multiple shelters and people with zip codes...
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
	reason == "adopt" ? here_to_adopt : here_to_surrender
end

def here_to_adopt
	prompt = TTY::Prompt.new
	email_address = prompt.ask('Great! First, what is your email?') { |q| q.validate :email }
	adoptee = Owner.find_or_create_by({email: email_address, kind: "Person"})
	binding.pry
	find_or_create_adoptee(adoptee)
	choose_pet_type

end

def here_to_surrender
	prompt = TTY::Prompt.new
	changed_mind = prompt.yes?("Sorry, we're full! Would you like a new pet instead?")
	if changed_mind == true
		here_to_adopt
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


# Choose type of animal to adopt
def choose_pet_type
  prompt = TTY::Prompt.new
	choose_pet_type = prompt.select("What type of pet are you looking for?") do |prompt|
		prompt.choice "Search for cats", "feline"
		prompt.choice "Search for dogs", "canine"
		prompt.choice "Search other animals", "other"
		prompt.choice "Search all animals", "all"
	end

	# Empty array to fill during get_animals loop
	pets = []

	# Loop through animals available at this shelter
	get_animals(choose_pet_type).each_with_index do |pet_owner, index|
		pet_obj = pet_owner.pet
		details = pet_info(pet_owner, index)

		# Add animal description and object to [pets]
		pets << {name: details, value: pet_obj}
	end

	# Add a back button to list
	pets << {name: "<< Go Back", value: "back"}

	# Show all pets from search
	pet_selector(pets)
end


# Create pet description for
def pet_info(pet_owner, index)
	pet = pet_owner.pet
	case pet.species
		when "feline" || "cat"
			icon = ["🐱", "😼", "😿", "😸", "😽", "😻", "🦁"].sample
		when "canine" || "dog"
			icon = ["🐶", "🐕", "🐩", "🐺", "🦊"].sample
		when "n. hollandicus" || "bird"
			icon = ["🐥", "🦆", "🕊️", "🐦" ].sample
		when "horse"
			icon = ["🐴"]
		when "pig"
			icon = ["🐖"]
		when "unicorn"
			icon = ["🦄"]
		when "camel"
			icon = ["🐪"]
		when "lizard" || "reptile"
			icon = ["🐊"]
		when "dinosaur"
			icon = ["🦖", "🦕"].sample
		when "fish"
			icon = ["🐟","🦈", "🐠"].sample
		else
			icon = "🐾"
	end
	return "#{icon} #{pet.name.capitalize}, a #{pet.age}-year-old #{pet.gender} #{pet.breed.capitalize}"
end


def shelter_animals
	pets_shelter = PetOwner.all.select do |pet_owner|

		#if the pet is currently owned by the shelter
		if pet_owner.owner.kind == "Shelter"

			# Return pet_owner relationship
			pet_owner
		end
	end
end


# Retrieve animals to display based on species selection
def get_animals(pet_species)
	case pet_species
		when "feline" || "cat"
			# Show list of shelter cats
			shelter_animals.select {|pet_owner| pet_owner.pet.species == "feline"}

		when "canine" || "dog"
			# Show list of shelter dogs
			shelter_animals.select {|pet_owner| pet_owner.pet.species == "canine"}

		when "other"
			# Show list of pets who are not cats or dogs
			shelter_animals.select {|pet_owner| pet_owner.pet.species != "feline" && pet_owner.pet.species != "canine"}

		else
			# Show list of all pets
			shelter_animals.select {|pet_owner| pet_owner.pet}
	end
end


# Show selectable list of chosen pet types
def pet_selector(pets)
	prompt = TTY::Prompt.new
	selected_pet = prompt.select("Available Pets:", pets)

	# Show individual pet selected from list
	get_the_selected_pet(selected_pet)
end


# Display single pet shown from pet_selector
def get_the_selected_pet(selected_pet)
	if selected_pet == "back"
		choose_pet_type
	end

	name = selected_pet.name
	breed = selected_pet.breed
	status = selected_pet.status
	puts "#{name} is #{status}!"

	prompt = TTY::Prompt.new
	adopt_this_pet = prompt.select("Adopt #{name} the #{breed}?") do |prompt|
		prompt.choice "Yes!", true
		prompt.choice "No.", false
	end

	# If yes, serve adoption contract. Else, go back to adoptions
	adopt_this_pet == true ? agree_to_adopt(selected_pet) : choose_pet_type
end


# Last step before transfer_ownership
def agree_to_adopt(selected_pet)
	puts contract = "\nI hereby agree that the above described animal is being adopted by me solely as a pet for myself and/or my immediate family. I agree that I will not sell, give away or otherwise dispose of said animal to any persons, dealer, retailer, auction, institute or any other entity for any reason. If at a later date I am unable or unwilling to keep this pet, I agree to first contact the above described current owner and give them the option to reclaim said pet at no charge.\n\n"

  prompt = TTY::Prompt.new
	agree_to_contract = prompt.select("Do you agree with the adoption contract?") do |prompt|
		prompt.choice "Agree", true
		prompt.choice "Disagree", false
	end

  agree_to_contract == true ? transfer_ownership(selected_pet) : choose_pet_type
end

######################################################################
######################################################################

# May have to pass more than just selected_pet
	# def transfer_ownership(selected_pet, current_owner, new_owner)

def transfer_ownership(selected_pet)
	puts "This is where we transfer pet ownership"
	current_owner = ""
	#1. match {{selected_pet.id}} to {{PetOwner.pet_id}}
	#2. set {{PetOwner.owner_id}} to {{new_owner.id}}
	#3. add new row to PetOwner table with relationship and current?: true
	#4. set previous PetOwner relationship to current?: false

	#PetOwner.all.select{|pet_owner| pet_owner.pet_id == 4 && pet_owner.owner_id == 1}
	#PetOwner.all.select{|pet_owner| pet_owner.owner.kind == "Shelter"}

  # selected_pet.each do |pet|
  #   pet.owner
  #   #owner = find_or_create_adoptee
  #   # binding.pry
  #   #Pet.update
  # end
end

######################################################################
######################################################################

def runner
    welcome
    reason_for_visit?
end

#binding.pry
#welcome
#choose_pet_type
runner
