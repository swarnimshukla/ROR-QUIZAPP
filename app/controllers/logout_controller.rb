class LogoutController < ApplicationController
  def index
  	redirect_to  destroy_user_session_path, method:delete
  end
end
