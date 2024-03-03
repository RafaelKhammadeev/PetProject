users_attributes = [ 
  { email: "admin@example.com", password: "123456", name: "Admin", surname: "Admin", role: "admin" },
  { email: "test@example.com", password: "123456", name: "Rafael", surname: "Khammadeev" }
]

users_attributes.each do |attributes|
  User.create!(attributes)
end
