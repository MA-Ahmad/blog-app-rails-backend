class Api::V1::LikesController < ApiController

    def create
        params[:like][:user_id] = current_user.id
        @like = Like.new(like_params)
        if @like.save
        #   count = Blog.find(params[:like][:reference_id]).likes.count if params[:like][:reference_type] == 'Blog'
            set_blogs
            render json: @blogs
        elsif already_liked?
            destroy
            set_blogs
            render json: @blogs
        else
            render json: { status: :error, message: @like.errors.full_messages.join(', '), liked: false }
        end
    end

    def destroy
        @like = Like.where(like_params)&.first
        @like.destroy
    end

    protected

    def already_liked?
        Like.where(like_params).exists?
    end

    def set_blogs
        @blogs = JSON.parse(Blog.includes(:user, :likes, :bookmarks).order(created_at: :desc).to_json(include: {user: {except: :created_at}, likes: {except: :created_at}, bookmarks: {except: :created_at}}))  
    end

    def like_params
        params.require(:like).permit(:value, :user_id, :reference_id, :reference_type)
    end
end