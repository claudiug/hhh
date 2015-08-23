module Credentials
  def api_user
    'user' #ENV.fetch('API_USER')
  end

  def api_password
    'password' #ENV.fetch('API_PASSWORD')
  end
end