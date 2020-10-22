class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :index]

  def index
  end

  def new
    render 'index'
  end

  def create
    @usernew = User.create(userParams)
    if @usernew.valid?
        flash[:success] = "You've successfully created a new User!"
        redirect_to root_path
    else
        flash[:errors] = @usernew.errors.full_messages
        redirect_to root_path
    end
  end

  def show
    @songsall = Song.all
    @songfind = Song.find_by(user_id: @usershow)
    @usershow = User.find(params[:id])
    @songshow = Add.find_by(user_id: @usershow, song_id: params[:song_id])
    @findsong = Song.find(@usershow.adds.map {|s| s.song_id})

    @songs = @usershow.songs.all + @usershow.adds.map(&:song)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def userParams
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
