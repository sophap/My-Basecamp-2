class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  before_action :authenticate_user!
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to '/projects', notice: "Access denied: #{exception.message}"  
      end

      
end
