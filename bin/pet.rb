class Pet < ActiveRecord::Base
    has_many :pet_owners
    has_many :owners, through: :pet_owners
end