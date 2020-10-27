class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    skip_before_action :track_ahoy_visit
    # after_action :track_action
    
    # protected
    # # track events with ahoy_matey gem.
    # def track_action
    #     ahoy.track "Viewed #{controller_name}##{action_name}", request.filtered_parameters
    # end
end
