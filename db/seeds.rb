require_relative "../config/environment.rb"

# wilke = Patient.find_or_create_by(name: "Mrs Wilke")
# johnny = Patient.find_or_create_by(name: "Johnny the Tackling Alzheimer's Patient")
# ben = Patient.find_or_create_by(name: "Ben Sullivan")

# wilke.doctors << turk
# wilke.doctors << jd

owner1 = Owner.find_or_create_by({name: "Keith", email: "krburgie@gmail.com", zip_code: 23223, kind: "Person"})
owner2 = Owner.find_or_create_by({name: "Natany", email: "natanycaxeta@icloud.com", zip_code: 20002, kind: "Person"})
owner3 = Owner.find_or_create_by({name: "Animal Shelter", email: "info@animalshelter.com", zip_code: 20002, kind: "Shelter"})

pet1 = Pet.find_or_create_by({name: "Bob", breed: "mutt", age: "3", status: "ready for adoption", color: "black", size: "medium", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})
pet2 = Pet.find_or_create_by({name: "Ruby", breed: "persa", age: "10", status: "ready for adoption", color: "brown", size: "medium", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "female", species: "feline"})
pet3 = Pet.find_or_create_by({name: "Soda", breed: "old english sheepdog", age: "5", status: "ready for adoption", color: "gray", size: "large", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "female", species: "canine"})
pet4 = Pet.find_or_create_by({name: "Coke", breed: "sphynx", age: "1", status: "ready for adoption", color: "gray", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "feline"})
pet5 = Pet.find_or_create_by({name: "Pepsi", breed: "dachshund", age: "1", status: "ready for adoption", color: "black", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})
pet6 = Pet.find_or_create_by({name: "Cheese", breed: "dachshund", age: "1", status: "ready for adoption", color: "black", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})
pet7 = Pet.find_or_create_by({name: "Selfie", breed: "dachshund", age: "1", status: "ready for adoption", color: "black", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "female", species: "canine"})
pet8 = Pet.find_or_create_by({name: "Refri", breed: "dachshund", age: "1", status: "ready for adoption", color: "brown", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})

pet_owner1 = PetOwner.find_or_create_by({pet: pet1, owner: owner1, current?: true})

binding.pry
0
