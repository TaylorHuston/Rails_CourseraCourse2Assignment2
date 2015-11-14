# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create! [
  {username: "Fiorina", password_digest: "pass"},
  {username: "Trump", password_digest: "pass"},
  {username: "Carson", password_digest: "pass"},
  {username: "Clinton", password_digest: "pass"}
  ]

user = User.find_by(username: "Fiorina")
user.profile = Profile.create!({first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female"})

user = User.find_by(username: "Trump")
user.profile = Profile.create!({first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male"})

user = User.find_by(username: "Carson")
user.profile = Profile.create!({first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male"})

user = User.find_by(username: "Clinton")
user.profile = Profile.create!({first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female"})

users = User.all.to_a

users.each do |user|
  user.todo_lists << TodoList.create!({list_name: "A List", list_due_date: (Date.today+1.year)})
  
  5.times do
    user.todo_lists.first.todo_items << TodoItem.create({title: "An Item", description: "Description", due_date: (Date.today+1.year)})
  end
    
end