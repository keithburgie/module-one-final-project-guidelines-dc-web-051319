class CreateOwnersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :kind
    end
  end
end
