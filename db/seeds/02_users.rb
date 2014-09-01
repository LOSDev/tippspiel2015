User.create(email:"loschdev@gmail.com", password: "password", username: "FCBFan")
User.create(email:"test@example.com", password: "password", username: "Zufall")
User.create(email:"heimtipper@example.com", password: "password", username: "2zu1-Tipper")
User.create(email:"unentschieden@example.com", password: "password", username: "Unentschieden")
(1..100).each do |n|
  User.create(email: "test#{n}@example.com", password: (1..8).map { (65 + rand(26)).chr }.join, username:"User_#{n}")
end