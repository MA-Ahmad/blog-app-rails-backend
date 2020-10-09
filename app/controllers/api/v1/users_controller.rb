class Api::V1::UsersController < ApiController
    before_action :authenticate, only: :update
    
    def update
        if current_user.update(JSON.parse(params[:user]))
            current_user.update(image: params[:image]) if params[:image].present?
            # current_user.attach_image(params[:image]) if params[:image].present?
            render json: @current_user
        else
            render json: { status: :error, updated: false, }, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :image)
    end
end
  