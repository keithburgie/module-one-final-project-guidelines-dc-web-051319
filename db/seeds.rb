require_relative "../config/environment.rb"

# sacred = Hospital.find_or_create_by(name: "Sacred Heart")

# jd = Doctor.find_or_create_by(name: "John Dorian",
#     specialty: "Internal Medicine",
#     hospital_id: sacred.id)
# eliot = Doctor.find_or_create_by(name: "Eliot Reid", specialty: "Endocrinology",
#     hospital: sacred)
# turk = Doctor.find_or_create_by(name: "Chris Turk", specialty: "Surgery",
#     hospital: sacred)

# wilke = Patient.find_or_create_by(name: "Mrs Wilke")
# johnny = Patient.find_or_create_by(name: "Johnny the Tackling Alzheimer's Patient")
# ben = Patient.find_or_create_by(name: "Ben Sullivan")

# wilke.doctors << turk
# wilke.doctors << jd

owner1 = Owner.find_or_create_by({name: "Keith", zip_code: 23223, kind: "Person"})
owner2 = Owner.find_or_create_by({name: "Natany", zip_code: 20002, kind: "Person"})
owner3 = Owner.find_or_create_by({name: "Animal Shelter", zip_code: 20002, kind: "Shelter"})

pet1 = Pet.find_or_create_by({name: "", breed: "", age: "", status: "", color: "", size: "", fee: "", bio: "", gender: "", species: ""})

pet_owner1 = PetOwner.find_or_create_by({pet: pet1, owner: owner1, current?: true})

binding.pry
0