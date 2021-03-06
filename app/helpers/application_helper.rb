module ApplicationHelper
  def sample_helper
    "<p>My helper</p>".html_safe
  end

  def login_helper
    if current_user.is_a? GuestUser
      (link_to "Login", new_user_session_path) + "<br>".html_safe +
      (link_to "Register", new_user_registration_path)
    else
      link_to "Logout", destroy_user_session_path, method: :delete
    end
  end

  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}. You're on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end
end
