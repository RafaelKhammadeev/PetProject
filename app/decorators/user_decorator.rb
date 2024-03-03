class UserDecorator < Draper::Decorator
  delegate :email

  def full_name
    "#{object.name} #{object.surname}"
  end
end
