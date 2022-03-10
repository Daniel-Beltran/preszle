class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
  end

  def home
    @images = []
    for x in [1,2,3,4] do
      @images.push(ActionController::Base.helpers.image_path("image#{x}.jpg"))
    end
  end

  def readtime
    current_user.readtime = params[:readtime]
    current_user.save
    redirect_to articles_path
  end
end
