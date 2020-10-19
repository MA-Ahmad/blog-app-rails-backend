class Api::V1::UsersController < ApiController
    before_action :authenticate, only: :update
    
    def update
        if current_user.update(user_params)
            current_user.attach_image(params[:user][:image_file]) if params[:user][:image_file].present?
            render json: @current_user
        else
            render json: { status: :error, updated: false, }, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :username, :location, :summary, :education, :emp_name, :emp_title, :skills, :image_file)
    end
end
  