class SongsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

    def new
        @song = Song.new
      end
    
      def index
        @songs = Song.all

        if params[:tag_ids]
          @songs = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_songs = Tag.find_by(name: key).songs
              @songs = @songs.empty? ? tag_songs : @songs & tag_songs
            end
          end
        end

        if params[:search] == nil
          @song = params[:tag_id].present? ? Tag.find(params[:tag_id]).registers : Song.all
        elsif params[:search] == ''
          @song = params[:tag_id].present? ? Tag.find(params[:tag_id]).registers : Song.all
        else

          @song = Song.where("storename LIKE ? OR menu LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
        end

      end

      def create
        song = Song.new(song_params)
        song.user_id = current_user.id  #追記
        if song.save!
          redirect_to :action => "new"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @song = Song.find(params[:id])
      end
    
      def edit
        @song = Song.find(params[:id])
      end

      def update
        song = Song.find(params[:id])
        if song.update(song_params)
          redirect_to :action => "show", :id => song.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        song = Song.find(params[:id])
        song.destroy
        redirect_to action: :index
      end

      private
      def song_params
        params.require(:song).permit(:tile, :name, :about, tag_ids: [])
      end



end
