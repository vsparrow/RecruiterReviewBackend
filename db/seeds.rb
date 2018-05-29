# This file contains all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#THIS WILL CREATE 5 users, 5 RECUITERS and 5 REVIEWS FOR EACH
user1 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,   scrambleview: false  )
user2 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,   scrambleview: false  )
user3 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,   scrambleview: false  )
user4 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,   scrambleview: false  )
user5 = User.create(   firstname: Faker::Name.first_name,     lastname: Faker::Name.last_name,     email: Faker::Internet.email,     password_digest: "something",     admin: false,   scrambleview: false  )
users = [user1,user2,user3,user4,user5]

5.times do
  company = Faker::Internet.domain_word
  website = "www." + company + ".com"
  lastname = Faker::Name.last_name
  email = lastname.downcase + "@" + company + ".com"
  linkedin = "http://lnkd.in/" + lastname.downcase
  recruiter1 = Recruiter.create( firstname:  Faker::Name.first_name,   lastname:  lastname,   email:  email,   phonenumber:  Faker::PhoneNumber.cell_phone,   is_generated:  true,   website:  website ,   company:  company.capitalize + " Inc.",   linkedin:  linkedin,   location:  Faker::Address.state)

  users.each do |user|
    # review = Review.new(  user_id: user.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.words(rand(20..60)).join(' '),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
    review = Review.new(  user_id: user.id,  recruiter_id: recruiter1.id,   review: Faker::Lorem.paragraph(3, true, 15),   got_interview: [true, false].sample,   got_job: [true, false].sample,  recommended: [true, false].sample, rating: [1, 2, 3, 4, 5].sample,   is_generated: true,     ghoster: true)
    review.got_job ? review.got_interview = true : ""
    review.save
  end

end
