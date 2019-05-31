require_relative "../config/environment.rb"

# wilke = Patient.find_or_create_by(name: "Mrs Wilke")
# johnny = Patient.find_or_create_by(name: "Johnny the Tackling Alzheimer's Patient")
# ben = Patient.find_or_create_by(name: "Ben Sullivan")

# wilke.doctors << turk
# wilke.doctors << jd

owner1 = Owner.find_or_create_by({name: "Flatiron Animal Shelter", email: "info@animalshelter.com", kind: "Shelter"})
owner2 = Owner.find_or_create_by({name: "Keith", email: "krburgie@gmail.com", kind: "Person"})
owner3 = Owner.find_or_create_by({name: "Natany", email: "natanycaxeta@icloud.com", kind: "Person"})

pet1 = Pet.find_or_create_by({name: "Bob", breed: "mutt", age: "3", status: "ready for adoption", color: "black", size: "medium", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})
pet2 = Pet.find_or_create_by({name: "Ruby", breed: "persa", age: "10", status: "ready for adoption", color: "brown", size: "medium", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "female", species: "feline"})
pet3 = Pet.find_or_create_by({name: "Soda", breed: "old english sheepdog", age: "5", status: "ready for adoption", color: "gray", size: "large", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "female", species: "canine"})
pet4 = Pet.find_or_create_by({name: "Coke", breed: "sphynx", age: "1", status: "ready for adoption", color: "gray", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "feline"})
pet5 = Pet.find_or_create_by({name: "Pepsi", breed: "dachshund", age: "1", status: "ready for adoption", color: "black", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})
pet6 = Pet.find_or_create_by({name: "Cheese", breed: "dachshund", age: "1", status: "ready for adoption", color: "black", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})
pet7 = Pet.find_or_create_by({name: "Selfie", breed: "dachshund", age: "1", status: "ready for adoption", color: "black", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "female", species: "canine"})
pet8 = Pet.find_or_create_by({name: "Refri", breed: "dachshund", age: "1", status: "ready for adoption", color: "brown", size: "small", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "canine"})
pet9 = Pet.find_or_create_by({name: "Suco", breed:"cockatiel", age: "2", status: "ready for adoption", color: "gray", size:"nil", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "n. hollandicus"})
pet10 = Pet.find_or_create_by({name: "Rex", breed:"tyrannosaurus", age: "35", status: "ready for adoption", color: "greenish", size:"nil", fee: "50", bio: "Lorem ipsum dolor sit amet.", gender: "male", species: "dinosaur"})

pet_owner1 = PetOwner.find_or_create_by({pet: pet1, owner: owner1, current?: true})
pet_owner2 = PetOwner.find_or_create_by({pet: pet2, owner: owner1, current?: true})
pet_owner3 = PetOwner.find_or_create_by({pet: pet3, owner: owner1, current?: true})
pet_owner4 = PetOwner.find_or_create_by({pet: pet4, owner: owner1, current?: true})
pet_owner5 = PetOwner.find_or_create_by({pet: pet5, owner: owner1, current?: true})
pet_owner6 = PetOwner.find_or_create_by({pet: pet6, owner: owner1, current?: true})
pet_owner7 = PetOwner.find_or_create_by({pet: pet7, owner: owner1, current?: true})
pet_owner8 = PetOwner.find_or_create_by({pet: pet8, owner: owner1, current?: true})
pet_owner9 = PetOwner.find_or_create_by({pet: pet9, owner: owner1, current?: true})
pet_owner10 = PetOwner.find_or_create_by({pet: pet10, owner: owner2, current?: true})





#binding.pry
0
