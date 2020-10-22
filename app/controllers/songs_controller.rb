class SongsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def index
        @adds = Add.all
        @songs = Song.all
    end

    def create
    @newsong = Song.new(songParams)
    @newsong.user = current_user
    @newsong.save
        if @newsong.valid?
            flash[:success] = "You've successfully created a new Song!"
            redirect_to songs_path
        else
            flash[:errors] = @newsong.errors.full_messages
            redirect_to songs_path
        end
    end

    def show
        @song = Song.find(params[:id])
        @songusers = Song.find(params[:id]).user
        @songadd = User.find(@song.adds.map {|l| l.user_id})
        @user = current_user.id
        @users = User.all
    end

    def songParams
        params.require(:song).permit(:title, :artist)
    end

end
