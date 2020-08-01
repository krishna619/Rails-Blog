class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy,:save_post_view]
  before_action :authenticate_user! , except: [:show]
  before_action :can_modify_posts ,  only:[:edit, :update, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.active.order_by_latest_first
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
   
      if @post.save
         redirect_to @post, notice: 'Post was successfully created.' 
       
      else
        render :new 
        
      end
    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    
      if @post.update(post_params)
          redirect_to @post, notice: 'Post was successfully updated.' 
        
      else
        render :edit 
        
      end
    
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    
        redirect_to posts_url, notice: 'Post was successfully destroyed.' 
    
  end
  def save_post_view
    @post.increment(:views, 1).save
  end
  private

    def can_modify_posts
    redirect_back(fallback_location: root_path) and return unless @post.user_id == current_user.id
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :summary, :body, :active)
    end

end
