class AddsController < ApplicationController
  def create
    newadd = Add.create(user: current_user, song: Song.find(params[:song_id]))

    redirect_to songs_path
  end

  def destroy
  end
end
