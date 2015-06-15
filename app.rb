require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'sinatra/reloader'
require 'wordnik'

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  erb :index
end

get '/api/v1/word' do
  number_of_possible_choices = Word.where("part_of_speech = ? AND flarf = ?", params["part_of_speech"], params["flarf"] ).count
  id_no = rand(1..number_of_possible_choices)
  word = Word.where("part_of_speech = ? AND flarf = ?", params["part_of_speech"], params["flarf"]).offset(id_no).limit(1)
  json word
end
