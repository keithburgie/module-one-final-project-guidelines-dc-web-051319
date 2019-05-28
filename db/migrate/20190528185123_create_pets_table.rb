class CreatePetsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :status
      t.string :color
      t.string :size
      t.integer :fee
      t.string :bio
      t.string :gender
      t.string :species
    end
  end
end
