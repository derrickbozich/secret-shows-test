module SessionsHelper
  def login_logout_link
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path,:method => 'delete', class: 'dropdown-item'
    else
      link_to 'Login', user_session_path, class: 'dropdown-item'
    end
  end
end
