require 'bundler'
Bundler.require
require_relative 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get  '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
  
  get  '/gossips/view/' do
    erb :get_gossip
  end
  post '/gossips/view/' do
    index = params["gossip_number"].to_i
    redirect "/gossips/#{index}"
  end
  
  get  '/gossips/:id' do
    index = params["id"].to_i
    erb :show, locals: {gossip: Gossip.find(index), index: index}
  end

end