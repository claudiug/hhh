module AuthUser

  def auth_user(token)
     true #throw(:halt, 403) unless user.is_api_register? for testing now I do not have any tables
  end
end