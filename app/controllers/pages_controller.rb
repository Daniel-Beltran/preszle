class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
  end

  def home
  end

  def readtime
    current_user.readtime = params[:readtime]
    current_user.save
    redirect_to articles_path
  end
end
