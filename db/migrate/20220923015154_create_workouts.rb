class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.string :type
      t.boolean :status

      t.timestamps
    end
  end
end
