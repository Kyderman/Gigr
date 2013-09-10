class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.has_role? :musician
        redirect_to '/content/musician'
      end
      if current_user.has_role? :venue
        redirect_to '/content/venue'
      end
      if current_user.has_role? :band
        redirect_to '/content/band'
      end
      if current_user.has_role? :admin
        redirect_to 'users#index'
      end
    end
  end
end
