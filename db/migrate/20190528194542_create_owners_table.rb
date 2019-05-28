class CreateOwnersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.integer :zip_code
      t.string :kind
    end
  end
end
