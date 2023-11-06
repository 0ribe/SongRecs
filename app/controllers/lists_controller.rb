class ListsController < ApplicationController
    def index
        @songs = Song.all
      end
end
