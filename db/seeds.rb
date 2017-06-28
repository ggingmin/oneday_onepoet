# User

User.create!(name:  "조경민",
             email: "ggingmin@likelion.org",
             password:              "qweasdzxcv",
             password_confirmation: "qweasdzxcv",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "passwordpassword"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


# Micropost

users = User.order(:created_at).take(6)

50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end


# Follow

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }