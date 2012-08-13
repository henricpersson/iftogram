require 'json'
require 'rest-open-uri'

class OauthController < ApplicationController
  
  #FIXME: I have to reuse these from somewhere...
  CLIENT_ID = '5941c4645df04708ae67e1ad4b3d6684'
  CLIENT_SECRET = 'c021a1972d074190b93cd5f58c9138a0'
  INSTAGRAM_API_URL = 'https://api.instagram.com/oauth/access_token?grant_type=authorization_code&redirect_uri=http%3A%2F%2Fec2-01.dev.causes.com%3A3000%2Foauth%2Fauth'

  
  def auth
    url = "#{INSTAGRAM_API_URL}&code=#{params[:code]}&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"
    
    # Trying to find a way for this to work...
    json = open(url, :method => 'post').read

    session[:user] = JSON.parse(json)
    redirect_to :controller => 'search', :action => 'index'
  end
end
