# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Instructor.create!(firstname: "Joe", lastname: "Instructor", email: "joe@email.com", mobile: "0412345678")

instructor = Instructor.all.first

Client.create!(firstname: "Bob", lastname: "Client", email: "bob@email.com", mobile: "0411223344", sex: "Male", weight: 100, height: 180, dob: "2000-01-01", instructor: instructor)

Exercise.create!(name: "exercise1", description: "This is the description", image: "Imagesdsfd.jpg", url: "http://asdasd.com/asdasd")
Exercise.create!(name: "exercise2", description: "This is the description", image: "Imagesdsfd.jpg", url: "http://asdasd.com/asdasd")
Exercise.create!(name: "exercise3", description: "This is the description", image: "Imagesdsfd.jpg", url: "http://asdasd.com/asdasd")

Workout.create!(name: "workouttest1", workouttype: "Strength", exercise_ids: [1,2,3])
Workout.create!(name: "workouttest2", workouttype: "BodyBuilding", exercise_ids: [1,3])


