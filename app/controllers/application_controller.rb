class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    skip_before_action :track_ahoy_visit
    # after_action :track_action

    # protected

    # def track_action
    #     ahoy.track "Ran action", request.path_parameters
    # end
end
