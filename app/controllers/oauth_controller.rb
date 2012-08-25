require 'json'
require 'instagram'

class OauthController < ApplicationController
  
  def auth
    response = Instagram.get_access_token(params[:code], 
        redirect_uri: oauth_auth_url(return_to_url: params[:return_to_url]))
    session[:access_token] = response.access_token
    client = Instagram.client(:access_token => session[:access_token])
    session[:user] = client.user

    if params[:return_to_url]
      redirect_to params[:return_to_url]
    else
      redirect_to :controller => 'search', :action => 'index'
    end
  end

  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => 
          oauth_auth_url(return_to_url: params[:return_to_url]))
  end

  def logout
    session.clear
    redirect_to search_index_url
  end
end
