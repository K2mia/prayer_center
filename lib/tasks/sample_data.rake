
namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    # Create test users
    User.create!( name: "Example User",
                  email: "example@railstutorial.org",
                  password: "foobar",
                  password_confirmation: "foobar" )
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password )
    end	# 99.times do

    # Create test prayers
    users = User.all( limit: 10 )
    50.times do
      prayer = Faker::Lorem.paragraphs(rand(1..3)).join("\n")
      prayer.gsub!( /\-/, '' )

      users.each do |user|
        rand_public = rand(2) 
        rand_ptype = rand(2) 
        rand_anon = rand(2) 

        public = (rand_public % 2 == 0 ) ? true : false 
        ptype = (rand_ptype % 2 == 0 ) ? 1 : 2
        anon = (rand_anon % 2 == 0 ) ? true : false 
    
        user.prayers.create!( prayer: prayer, public: public, 
                               ptype: ptype, anon: anon ) 
      end 
    end    # 50.times

    # Create test keywords
    #users = User.all( limit: 6 )
    #50.times do
    #  keys = Faker::Lorem.sentence(1)
    #  users.each { |user| user.keywords.create!( keys: keys ) }
    #end    # 50.times

  end	# task populate do
end	# namespace do

