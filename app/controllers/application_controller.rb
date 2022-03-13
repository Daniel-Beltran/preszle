class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update
    @User = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :password))
      flash[:success] = "you are updated!"
    end
    redirect_to articles_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])

    devise_parameter_sanitizer.permit(:edit, keys: [:name, :email, :password])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
