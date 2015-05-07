User.create!(name:  "Nguyen Ngoc Truong",
             email: "truongadmin@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

2.times do
  name = Faker::Name.name
  Category.create!(name: name)
end

categories = Category.order(:created_at).take(2)
50.times do
  content = Faker::Lorem.word
  categories.each{|category| category.words.create!(content: content)}
end

words = Word.order(:created_at).take(100)
3.times do
  content = Faker::Lorem.word
  words.each{|word| word.answers.create!(content: content, correct: false)}
end

words.each do |word|
  content = Faker::Lorem.word
  word.answers.create!(content: content, correct: true)
end

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               admin: false)
end