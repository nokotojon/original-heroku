class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end
  
  def create
    
    @song = current_user.songs.new(song_params)
    
    if @song.save
      redirect_to songs_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def song_params
    params.require(:song).permit(:title, :rylic, :video)
  end
end