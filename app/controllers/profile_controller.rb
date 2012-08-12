class ProfileController < ApplicationController
  def view
	@id = params[:id]
  end
end
