require_relative '../config/credentials'
require_relative 'auth_user'

module HttpBasicAuth
  include Credentials
  include AuthUser

  def require_ssl!
    throw(:halt, 403) unless request.secure?
  end

  def http_basic_authorize!(realm, username, password)
    auth = Rack::Auth::Basic::Request.new(request.env)
    unless auth.provided? && auth.basic? && auth.credentials && auth.credentials == [username, password]
      response['WWW-Authenticate'] = %(Basic realm="#{realm}")
      throw(:halt, 401)
    end
  end

  def authorize_api!
    http_basic_authorize!('API', api_user, api_password)
  end
end