module V1
  class PostsController < MainController
    before_action :set_post, only: %i[show update destroy]

    # GET v1/post
    def index
      @posts = Post.all
      render json: @posts, status: :ok
    end

    # GET v1/post/:id
    def show
      if @post
        render json: @post, status: :ok
      else
        render json: { error: "Post not founded"}, status: :not_found
      end
    end

    # POST api/v1/post
    def create
      @post = Post.new(post_params)
      if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH api/v1/post/:id
    def update
      if @post.update(post_params)
        render json: @post, status: :ok
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # DELETE api/v1/post/:id
    def destroy
      render json: { message: "Sucessfully Deleted Bank Account" }, status: :ok if @post.destroy
    end

    private

    def post_params
      params.require(:post).permit(:title, :description)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end
  end

end