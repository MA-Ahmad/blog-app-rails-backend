class Api::V1::BookmarksController < ApiController
    before_action :find_blog

    def create
        params[:bookmark][:user_id] = current_user.id
        # @bookmark = Bookmark.new(bookmark_params)
        @bookmark = Bookmark.new(user: current_user, reference: @blog)
        if @bookmark.save
            set_blogs            
            render json: @blogs.first
        elsif already_bookmarked?
            destroy
            set_blogs
            render json: @blogs.first
        else
            render json: { status: :error, message: @bookmark.errors.full_messages.join(', '), bookmarked: false }
        end
    end

    def destroy
        # @bookmark = Bookmark.where(bookmark_params)&.first
        @bookmark = Bookmark.where(user: current_user, reference: @blog)&.first
        @bookmark.destroy
    end

    protected

    def already_bookmarked?
        # debugger
        # Bookmark.where(bookmark_params).exists?
        Bookmark.where(user: current_user, reference: @blog)
    end

    def find_blog
        @blog = Blog.find(params[:bookmark][:reference_id])
    end


    def set_blogs
        @blogs = JSON.parse(Blog.where(id: params[:bookmark][:reference_id]).includes(:user, :likes, :bookmarks).order(created_at: :desc).to_json(include: {user: {except: :created_at}, likes: {except: :created_at}, bookmarks: {except: :created_at}}))
        # @blogs = JSON.parse(Blog.includes(:user, :likes, :bookmarks).order(created_at: :desc).to_json(include: {user: {except: :created_at}, likes: {except: :created_at}, bookmarks: {except: :created_at}}))  
    end

    def bookmark_params
        params.require(:bookmark).permit(:user_id, :reference_id, :reference_type)
    end
end