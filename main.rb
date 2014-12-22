require 'rubygems'
require 'sinatra'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'AvaCash'


get '/' do
  if session[:player_name]
  else
    redirect 'new_player'
  end
end

get '/new_player' do
  erb :new_player
end

post 'set_name' do 
  session[:player_name] = params[:player_name]
  redirect '/game'
end


get '/game' do 
  erb :game
end

