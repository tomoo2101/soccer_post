class ApplicationController < ActionController::Base
    #deviseにまつわる画面に行った時にconfigure_permitted_parameters
    before_action :configure_permitted_parameters, if: :devise_controller?
    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
