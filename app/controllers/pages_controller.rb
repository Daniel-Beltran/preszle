class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    n = Articles.new("7b0920db76484943a73573fee21b80de")
    n.get_everything(q: "apple", from: "2018-01-05&to=2018-01-05", sortBy: "popularity")

  end


end
