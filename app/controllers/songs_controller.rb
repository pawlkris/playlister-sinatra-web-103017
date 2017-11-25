require 'rack-flash'


class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do
    # @song = Song.create(:name => params[:song][:name])
    # @song.artist = Artist.find_or_create_by(:name => params[:song][:artist])
    # @song.genre_ids = params[:genres]
    # @song.save
    #
    # flash[:message] = "Successfully created song."
    #
    # redirect("/songs/#{@song.slug}")

    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @genres = params[:genres].collect{|x|Genre.find_by_id(x)}
    @song = Song.create(name: params[:song][:name], genres: @genres, artist: @artist)
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end



  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @genres = params[:genres].collect{|x|Genre.find_by_id(x)}
    @song.update(name: params[:song][:name], genres: @genres, artist: @artist)
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
