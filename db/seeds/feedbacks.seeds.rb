after :users do
  user = User.find_by!(email: "test@example.com")

  3.times do |x|
    Feedback.create!(title: "Feedback Title #{x}", message: "Feedback Message #{x}", user:)
  end
end