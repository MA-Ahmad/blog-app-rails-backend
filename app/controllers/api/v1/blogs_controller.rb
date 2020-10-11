class Api::V1::BlogsController < ApiController
    before_action :find_blog, except: [:index, :new, :create]
    before_action :authenticate, only: %i[create update destroy]
    before_action :track_ahoy_visit, only: :index

    def index
        @blogs = JSON.parse(Blog.includes(:user).order(created_at: :desc).to_json(include: [user: {only: [:name, :image]}]))
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
        @blog = current_user.blogs.new(JSON.parse(params[:blog]))
        if @blog.save
            @blog.update(image: params[:image]) if params[:image].present?
            render json: @blog
        else
            render json: { status: :error, updated: false, }, status: 422
        end
    end

    def edit
        render json: @blog
    end

    def update
        if @blog.update(JSON.parse(params[:blog]))
            # @blog.update(image: params[:image]) if params[:image].present?
            @blog.attach_image(params[:image]) if params[:image].present?
            render json: @blog
        else
            render json: { status: :error, updated: false, }, status: 422
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
        if params[:action] == 'show'
            @blog = JSON.parse(Blog.includes(:user).find(params[:id]).to_json(include: [user: {only: [:name, :image]}]))
        else
            @blog = Blog.find(params[:id])
        end
    end

    def blog_params
        params.require(:blog).permit(:title, :authorName, :content, :image, :user_id)
    end

    # Errors
    def errors(record)
        { errors: record.errors.messages }
    end
end