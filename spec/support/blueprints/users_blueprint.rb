User.blueprint do
  email { "user-#{sn}@test.com" }
  username  { Faker::Name.name }
  password { "password123" }
end

class User
  def with_role(role)
    self.roles << role
    self
  end
end
