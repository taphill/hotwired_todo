# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Todo.destroy_all
User.destroy_all

user = User.create(username: 'mikejones', password: 'Houston!', password_confirmation: 'Houston!')

user.todos.create(description: 'Clean the kitchen')
user.todos.create(description: 'Vaccum the floors')
user.todos.create(description: 'Wash shirts')
