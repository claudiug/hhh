require 'rubygems'
require 'sinatra/base'
require 'sinatra/contrib/all'
require "sinatra/activerecord"

require 'sqlite3'
require 'byebug'

require_relative 'lib/http_basic_auth'
require_relative 'lib/api_helpers'
require_relative 'lib/auth_user'
require_relative 'models/company'

class App < Sinatra::Base
  register Sinatra::Namespace
  register Sinatra::ActiveRecordExtension

  include HttpBasicAuth
  include ApiHelpers

  enable :sessions, :protection

  set :session_secret, 'CHANGEME' #ENV.fetch('SECRET')
  set :database, {adapter: "sqlite3", database: "ecr.sqlite3"}

  use Rack::Deflater

  namespace '/api/v1/' do


    before do
      #require_ssl! TURN on when we are live, we only accepts secure connections
      #authorize_api!
      #auth_user(token)
    end

    get '/' do
      # json(status: "Ok")
      json(companies: Company.all)
    end

    ##Accounts##
    get 'accounts/company/:id' do |id|

    end

    post 'accounts/company' do

    end

    get 'accounts/company/approval_status/:id' do |id|

    end

    patch 'accounts/company/update_approval_status/:id' do |id|

    end

    post 'accounts/company/location' do

    end

    patch 'accounts/company/location' do
    end

    ##Complaint##

    post 'company/complaint' do

    end

    get 'company/complaint' do |id|

    end

    get 'company/complaint/files' do |id|

    end
  end
end