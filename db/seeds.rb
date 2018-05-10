# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

4.times do
    User.create!( 
        email: Faker::Internet.unique.free_email,
        password: "password"
    )
end

User.create!(email: "samibirnbaum1@gmail.com", password: "password")

users = User.all

15.times do
    MemorialNotice.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name, 
        date_of_death: ["02/04/1956","20/10/1978","09/06/1996","17/01/2014","21/12/1987"].sample, 
        after_nightfall: [true, false].sample, 
        spouse: Faker::FamilyGuy.character, 
        child1: Faker::HarryPotter.character, 
        child2: [Faker::HarryPotter.character, nil].sample, 
        child3: nil,
        child4: nil, 
        child5: nil, 
        child6: nil, 
        child7: nil, 
        child8: nil, 
        child9: nil,
        child10: nil, 
        grandchild1: [Faker::LordOfTheRings.character, nil].sample,
        grandchild2: nil, 
        grandchild3: nil, 
        grandchild4: nil, 
        grandchild5: nil, 
        grandchild6: nil, 
        grandchild7: nil, 
        grandchild8: nil, 
        grandchild9: nil,
        grandchild10: nil,
        user: users.sample
    )
end


puts "#{User.all.count} Users Added"
puts "#{MemorialNotice.all.count} Memorial Notices Added"