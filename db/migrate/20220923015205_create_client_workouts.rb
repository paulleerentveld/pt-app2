class CreateClientWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :client_workouts do |t|
      t.references :client, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
