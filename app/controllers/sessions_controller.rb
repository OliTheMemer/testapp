class SessionsController < ApplicationController

	# When the user asks for the sign in page
	
	def new
	end
	
	#user clicks the sign in button
	
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user.present? && user.authenticate(params[:session][:password])
			#sign in the user in and redirect to user's show page
			sign_in user
			redirect_to user
		else
			#create an error message and re-render the signin form
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end
	
	#user clicks sign out
	
	def destroy
		sign_out
		redirect_to root_url
	end


end

