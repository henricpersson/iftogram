require 'open-uri'
require 'json'
require 'cgi'
class SearchController < ApplicationController

  CLIENT_ID = '5941c4645df04708ae67e1ad4b3d6684'
  INSTAGRAM_API_URL = 'https://api.instagram.com/v1/users/search'

  def index
    if params[:q].blank?
      @people = []
    else
      @query = params[:q]
      json = open("#{INSTAGRAM_API_URL}?q=#{CGI.escape(@query)}&client_id=#{CLIENT_ID}").read
      if results = JSON.parse(json)
        @people = results['data']
      end
    end
  end
end
