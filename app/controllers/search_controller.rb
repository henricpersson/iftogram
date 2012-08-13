require 'open-uri'
require 'json'
require 'cgi'
class SearchController < ApplicationController
  
  def index
      if (!params[:q].blank?) then
		  @query = CGI.escape(params[:q])
		  if (@query) then
			@results = JSON.parse(open("https://api.instagram.com/v1/users/search?q=#{@query}&client_id=5941c4645df04708ae67e1ad4b3d6684").read)
		  end
	  end
	 
  end
end
