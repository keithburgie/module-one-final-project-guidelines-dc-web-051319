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

owner1 = Owner.find_or_create_by(name: "Keith", type: "Person", zip_code: 23223)
owner2 = Owner.find_or_create_by(name: "Natany", type: "Person", zip_code: 20002)
owner3 = Owner.find_or_create_by(name: "Animal Shelter", type: "Shelter", zip_code: 20002)

pet1 = Pet.find_or_create_by(name: "", breed: "", age: "", status: "", color: "", size: "", fee: "", bio: "", gender: "", species: "")

binding.pry
0