class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@adventures = @user.adventures
		render 'users/show'
	end
end