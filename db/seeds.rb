# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Nyein Chan Su Lwin",
             email: "nyeinchansulwin.2011@gmail.com",
             password:              "12345678",
             role: 1,
             currentworkspace: nil)
user = User.find_by(email:"nyeinchansulwin.2011@gmail.com")
Workspace.create!(name: "Team2 Workspace",
            owner: user.id)
workspace = Workspace.find_by(name:"Team2 Workspace")

user.currentworkspace = workspace.id
user.save
UsersWorkspace.create!(user_id: user.id,
            workspace_id: workspace.id)