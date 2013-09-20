class BandsMusicianController < ApplicationController
  
  def req
    @this = BandsMusician.find(params[:bands_musician_id])
    @band = Band.find(@this.band_id)
    @musician = Musician.find(@this.musician_id)
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
        flash[:success] = "Band invite with #{@band.name} rejected"
      else
        flash[:danger] = "Band invite with #{@band.name} cannot be rejected"
      end
    
    redirect_to :back
  end
  
end
