module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    GuestUser.new(name: "Guest User", first_name: "Firstname", email: "abc@gmail.com")
  end
end
