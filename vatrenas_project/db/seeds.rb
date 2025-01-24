require 'bcrypt'

User.create!(
  name: "Fares Omari",
  email: "faresomarii13@gmail.com",
  encrypted_password: BCrypt::Password.create("123456"),
  role: "admin"
)
  User.create!(
  name: "Mohammad",
  email: "mohammad@gmail.com",
  encrypted_password: BCrypt::Password.create("123456"),
  role: "user"
)


