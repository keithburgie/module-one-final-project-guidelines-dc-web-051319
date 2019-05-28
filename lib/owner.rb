class Owner < ActiveRecord::Base
    has_many :pet_owners
    has_many :pets, through: :pet_owners
end