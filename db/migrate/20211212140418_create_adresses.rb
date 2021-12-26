class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.integer :customer_id, null: false
      t.string :name,         null: false
      t.string :postal_code,  null: false
      t.string :adress,       null: false
      t.datetime :created_at, null: false, default: "now"
      t.datetime :updated_at, null: false, default: "now"

      t.timestamps
    end

    add_foreign_key :adresses, :customers

  end
end
