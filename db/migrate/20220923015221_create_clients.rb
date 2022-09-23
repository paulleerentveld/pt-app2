class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :mobile
      t.string :sex
      t.integer :weight
      t.integer :height
      t.date :dob
      t.references :instructor, null: false, foreign_key: true

      t.timestamps
    end
    add_index :clients, :email, unique: true
    add_index :clients, :mobile, unique: true
  end
end
