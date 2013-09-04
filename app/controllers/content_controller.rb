class ContentController < ApplicationController
  before_filter :authenticate_user!
  
  def musician
    authorize! :view, :musician, :message => 'Access limited to Musician Plan subscribers.'
  end
  
  def band
    authorize! :view, :band, :message => 'Access limited to Band Plan subscribers.'
  end

 
end