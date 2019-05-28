require 'tty-prompt'

def welcome
    puts "Welcome to (Shelter Name)"
end

def reason_for_visit
    prompt = TTY::Prompt.new
    greeting = 'How can we help you today?'
    adopt = "I'm here to adopt."
    surrender = "I have an animal to surrender."
    choices = [adopt, surrender]
    reason = prompt.select(greeting, choices)
    puts "Reason = #{reason}"
end

# If reason == adopt
# Ask: "What type of animal?" : Feline, Canine
    # Show all ?
    # Or Filter by: Breed, Age, Color, Size, Gender
        # If Breed : Show list of all breeds
            # Show all unique breeds from table
        # If Age : Show range of ages
            # age < 1 = Kittens, Puppies
            # age > 1 = Adult Cats, Adult Dogs
        # If Color : Show unique list of colors
        # If Size : Show Small, Medium, Large
            # 1-25 = Small
            # 26-70 = Medium
            # 71-110 = Large
        # If Gender : Show Male, Female

