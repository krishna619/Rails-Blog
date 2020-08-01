module PostsHelper
	def post_meta post
	
	"Post has been created by #{post.user.present? ? post.user.first_name : 'Admin' } and viewed by #{post.views}"
	end

end
