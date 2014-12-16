class PostsController < ApplicationController
	
	def index
		@posts = Post.all.paginate(page: params[:page], per_page: 10).order('created_at DESC')
		# sleep(5)
		respond_to do |format|
  			format.html
  			format.js
		end
	end

end