class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "로그인이 필요합니다."
        redirect_to login_url
      end
    end
    
end
