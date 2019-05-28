class Owner < ActiveRecord::Base
    has_many :pets, through: :pet_owners
end