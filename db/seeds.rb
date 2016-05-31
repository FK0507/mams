User.create!(fname: "売り手",
             gname: "あどみん",
             email: "example1@m-match.com",
             kind: "seller",
             role: "admin",
             password:              "password",
             password_confirmation: "password")
User.create!(fname: "買い手",
             gname: "あどみん",
             email: "example2@m-match.com",
             kind: "buyer",
             role: "admin",
             password:              "password",
             password_confirmation: "password")
User.create!(fname: "しすてむ",
             gname: "あどみん",
             email: "example3@m-match.com",
             kind: "sys",
             role: "admin",
             password:              "password",
             password_confirmation: "password")               
             
=begin
10.times do |n|
  fname  = Faker::Japanese::Name.last_name
  gname  = Faker::Japanese::Name.first_name
  email = "example-#{n+1}@m-match.com"
  password = "password"
  User.create!(fname:  fname,
               gname:  gname,
               email: email,
               password:              password,
               password_confirmation: password)
end
=end
