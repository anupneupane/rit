User.blueprint do
  email { "user-#{sn}@test.com" }
  username  { Faker::Name.name }
  password { "password123" }
end
