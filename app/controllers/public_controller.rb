class PublicController < ApplicationController
	before_action :authenticate_user! , except: [:homepage]
	def homepage
		 @posts = Post.all
	end

end
