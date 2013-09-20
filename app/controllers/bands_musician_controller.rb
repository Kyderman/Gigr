class BandsMusicianController < ApplicationController
  
  load_and_authorize_resource
  
  def req
    
    @band = Band.where(user_id: current_user.id).first
    @musician = Musician.find(params[:bands_musician_id])
    unless @musician.nil?
      if BandsMusician.request(@band, @musician)
        flash[:success] = "#{@musician.name} has been invited to #{@band.name}"
      else
        flash[:danger] = "#{@musician.name} cannot be invited to #{@band.name}"
      end
    end
    redirect_to :back
  end
  
  def accept
    @this = BandsMusician.find(params[:bands_musician_id])
    @band = Band.find(@this.band_id)
    @musician = Musician.find(@this.musician_id)
    unless @band.nil?
      if BandsMusician.accept(@musician, @band)
        flash[:success] = "Band invite with #{@band.name} accepted"
      else
        flash[:danger] = "Band invite with #{@band.name} cannot be accepted"
      end
    end
    redirect_to :back
  end

  def reject
   @this = BandsMusician.find(params[:bands_musician_id])
    @band = Band.find(@this.band_id)
    @musician = Musician.find(@this.musician_id)
      if BandsMusician.reject(@musician, @band)
        if current_user.has_role? :band
        flash[:danger] = "Invite to #{@musician.name} cancelled"
        else
        flash[:danger] = "Band invite with #{@band.name} rejected"
        end
      else
        flash[:danger] = "Band invite with #{@band.name} cannot be rejected"
      end
    
    redirect_to :back
  end
  
end
