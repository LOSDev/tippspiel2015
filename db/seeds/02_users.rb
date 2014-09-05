User.create(email:"loschdev@gmail.com", password: "password", username: "FCBFan", confirmed_at: Time.now)
User.create(email:"test@example.com", password: "password", username: "Zufall", confirmed_at: Time.now)
User.create(email:"heimtipper@example.com", password: "password", username: "2zu1-Tipper", confirmed_at: Time.now)
User.create(email:"unentschieden@example.com", password: "password", username: "Unentschieden", confirmed_at: Time.now)
(1..25).each do |n|
  User.create(email: "test#{n}@example.com", password: (1..8).map { (65 + rand(26)).chr }.join, username:"User_#{n}", confirmed_at: Time.now)
end