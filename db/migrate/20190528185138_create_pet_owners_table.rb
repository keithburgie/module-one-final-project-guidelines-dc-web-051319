class CreatePetOwnersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_owners do |t|
      t.integer :pet_id
      t.integer :owner_id
      t.boolean :current?
    end
  end
end
