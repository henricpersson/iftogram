require 'open-uri'
require 'json'
require 'uri'
class SearchController < ApplicationController
  def index
	result
  end

  def result
	  @query = params[:q]
	  if (@query) then
		escUri = URI.escape("https://api.instagram.com/v1/users/search?q=#{@query}&client_id=5941c4645df04708ae67e1ad4b3d6684") 
	    @results = json_object = JSON.parse(open(escUri).read)
	  end
	  respond_to do |format|
		format.html { 
			render :template => "search/index.html.erb" 
		}
	  end
  end
end
