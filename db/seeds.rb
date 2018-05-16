# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(   firstname: "some",   lastname: "user",   email: "test@test.com",   password_digest: "something",   admin: false,   scrambleview: false  )
user2 = User.create(   firstname: "Bart",     lastname: "Simpson",     email: "someemail",     password_digest: "bart",     admin: false,     scrambleview: false    )
# user3 = User.create(     firstname: "",     lastname: "",     email: "",     password_digest: "",     admin: false,     scrambleview: false    )
# user4 = User.create(     firstname: "",     lastname: "",     email: "",     password_digest: "",     admin: false,     scrambleview: false    )
# user5 = User.create(     firstname: "",     lastname: "",     email: "",     password_digest: "",     admin: false,     scrambleview: false    )

recruiter1 = Recruiter.create( firstname:  "Maz",   lastname:  "Jabroni",   email:  "funny@guy.com",   phonenumber:  "2123904322",   is_generated:  true,   website:  "www.google.com",   company:  "Funnymen",   linkedin:  "",   location:  "NYC")
recruiter2 = Recruiter.create( firstname:  "Terrance",   lastname:  "Word",   email:  "i@amabook.com",   phonenumber:  "7184324432",   is_generated:  true,   website:  "www.aol.com",   company:  "NoCompany",   linkedin:  "",   location:  "NYC")
recruiter3 = Recruiter.create( firstname:  "Red",   lastname:  "Fromtheshow",   email:  "red@theseventies.com",   phonenumber:  "5164432322",   is_generated:  true,   website:  "www.yahoo.com",   company:  "WestWorld",   linkedin:  "",   location:  "California")
# recruiter = Recruiter.create( firstname:  "",   lastname:  "",   email:  "",   phonenumber:  "",   is_generated:  true,   website:  "",   company:  "",   linkedin:  "",   location:  "")

review1 = Review.create(  user_id: user1.id,  recruiter_id: recruiter1.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: false,   got_job: false,  rating: 2,   is_generated: true,   recommended: false,   ghoster: true)
review2 = Review.create(  user_id: user1.id,  recruiter_id: recruiter2.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: false,  rating: 4,   is_generated: true,   recommended: true,   ghoster: false)
review3 = Review.create(  user_id: user1.id,  recruiter_id: recruiter3.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: true,  rating: 5,   is_generated: true,   recommended: true,   ghoster: false)
review4 = Review.create(  user_id: user2.id,  recruiter_id: recruiter1.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: true,  rating: 5,   is_generated: true,   recommended: true,   ghoster: false)
review5 = Review.create(  user_id: user2.id,  recruiter_id: recruiter2.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: true,   got_job: false,  rating: 3,   is_generated: true,   recommended: true,   ghoster: true)
review6 = Review.create(  user_id: user2.id,  recruiter_id: recruiter3.id,   review: "Meow yowling nonstop the whole night, you have cat to be kitten me right meow ",   got_interview: false,   got_job: false,  rating: 1,   is_generated: true,   recommended: false,   ghoster: false)
# review = Review.create(  user_id: ,  recruiter_id: ,   review: "",   got_interview: false,   got_job: false,  rating: 5,   is_generated: true,   recommended: true,   ghoster: false)
#using catipsum
