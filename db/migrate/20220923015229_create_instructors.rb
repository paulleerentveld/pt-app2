class CreateInstructors < ActiveRecord::Migration[6.1]
  def change
    create_table :instructors do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :mobile

      t.timestamps
    end
    add_index :instructors, :email, unique: true
    add_index :instructors, :mobile, unique: true
  end
end
