# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,   scrambleview: false  )
# user2 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,     scrambleview: false    )
# user3 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,     scrambleview: false    )
# user4 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,     scrambleview: false    )
# user5 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,     scrambleview: false    )
# user3 = User.create(     firstname: "",     lastname: "",     email: "",     password_digest: "",     admin: false,     scrambleview: false    )
# user4 = User.create(     firstname: "",     lastname: "",     email: "",     password_digest: "",     admin: false,     scrambleview: false    )
# user5 = User.create(     firstname: "",     lastname: "",     email: "",     password_digest: "",     admin: false,     scrambleview: false    )

# recruiter1 = Recruiter.create( firstname:  "Maz",   lastname:  "Jabroni",   email:  "funny@guy.com",   phonenumber:  "2123904322",   is_generated:  true,   website:  "www.google.com",   company:  "Funnymen",   linkedin:  "",   location:  "NYC")
# recruiter2 = Recruiter.create( firstname:  "Terrance",   lastname:  "Word",   email:  "i@amabook.com",   phonenumber:  "7184324432",   is_generated:  true,   website:  "www.aol.com",   company:  "NoCompany",   linkedin:  "",   location:  "NYC")
# recruiter3 = Recruiter.create( firstname:  "Red",   lastname:  "Fromtheshow",   email:  "red@theseventies.com",   phonenumber:  "5164432322",   is_generated:  true,   website:  "www.yahoo.com",   company:  "WestWorld",   linkedin:  "",   location:  "California")
company = Faker::Internet.domain_word
website = "www." + company + ".com"
lastname = Faker::Name.last_name
email = lastname.downcase + "@" + company + ".com"
linkedin = "http://lnkd.in/" + lastname.downcase
recruiter1 = Recruiter.create( firstname:  Faker::Name.first_name,   lastname:  lastname,   email:  email,   phonenumber:  Faker::PhoneNumber.cell_phone,   is_generated:  true,   website:  website ,   company:  company.capitalize + " Inc.",   linkedin:  linkedin,   location:  Faker::Address.state)
#
# review = Faker::Lorem.words(rand(10..20))
review = Review.new(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
review.got_job ? review.got_interview = true : ""
review.save
review = Review.new(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
review.got_job ? review.got_interview = true : ""
review.save
review = Review.new(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
review.got_job ? review.got_interview = true : ""
review.save
review = Review.new(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
review.got_job ? review.got_interview = true : ""
review.save
review = Review.new(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
review.got_job ? review.got_interview = true : ""
review.save
# review = Review.new(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
# review.got_job ? review.got_interview = true : null
# review = Review.new(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
# review.got_job ? review.got_interview = true : null
# review2 = Review.create(  user_id: user1.id,  recruiter_id: recruiter2.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: false,  rating: 4,   is_generated: true,   recommended: true,   ghoster: false)
# review3 = Review.create(  user_id: user1.id,  recruiter_id: recruiter3.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: true,  rating: 5,   is_generated: true,   recommended: true,   ghoster: false)
# review4 = Review.create(  user_id: user2.id,  recruiter_id: recruiter1.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: true,  rating: 5,   is_generated: true,   recommended: true,   ghoster: false)
# review5 = Review.create(  user_id: user2.id,  recruiter_id: recruiter2.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: false,  rating: 3,   is_generated: true,   recommended: true,   ghoster: true)
# review6 = Review.create(  user_id: user2.id,  recruiter_id: recruiter3.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: false,   got_job: false,  rating: 1,   is_generated: true,   recommended: false,   ghoster: false)
# review = Review.create(  user_id: ,  recruiter_id: ,   review: "",   got_interview: false,   got_job: false,  rating: 5,   is_generated: true,   recommended: true,   ghoster: false)
#using catipsum
