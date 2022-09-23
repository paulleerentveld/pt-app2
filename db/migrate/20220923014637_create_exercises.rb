class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.text :image
      t.text :url

      t.timestamps
    end
    add_index :exercises, :name, unique: true
  end
end
