class Api::V1::BlogsController < ApiController
    before_action :find_blog, except: [:index, :new, :create]
    before_action :authenticate, only: %i[create update destroy]

    def index
        @blogs = Blog.includes(:user).all.order(created_at: :desc)
        # JSON.parse(Blog.includes(:user).limit(2).order(created_at: :desc).to_json(include: [user: {only: :name}]))
        render json: @blogs
    end

    def show
        if @blog
            render json: @blog
        else
            render json: @blog.errors
        end
    end

    def new
        @blog = Blog.new
        render json: @blog
    end

    def create
        @blog = Blog.create!(blog_params)
        if @blog
            render json: @blog
        else
            render json: errors(@blog), status: 422
        end
    end

    def edit
        render json: @blog
    end

    def update
        if @blog.update(blog_params)
            render json: @blog
        else
            render json: errors(@blog), status: 422
        end
    end

    def destroy
        if @blog.destroy
            render json: { message: 'Blog deleted!' }
        else
            render json: errors(@blog), status: 422
        end
    end

    private

    def find_blog
        @blog = Blog.find(params[:id])
    end

    def blog_params
        params.require(:blog).permit(:title, :authorName, :content, :image, :user_id)
    end

    # Errors
    def errors(record)
        { errors: record.errors.messages }
    end
end