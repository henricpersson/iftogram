require 'instagram'
class ProfileController < ApplicationController
  def view
    @result = {}
    begin 
      @result[:media] = Instagram.user_recent_media(params[:id], access_token: session[:access_token])
      @result[:success] = true
    rescue Exception => e
      @result[:success] = false
    end
  end
end
