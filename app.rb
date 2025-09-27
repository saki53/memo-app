# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require_relative 'models/memo'

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

get '/' do
  redirect '/memos'
end

get '/memos' do
  @memos = Memo.all
  @show_add_button = true
  erb :index
end

get '/memos/new' do
  erb :new
end

post '/memos' do
  memo = Memo.new({
                    'title' => params[:title],
                    'content' => params[:content]
                  })
  memo.save
  redirect '/memos'
end

get '/memos/:id' do
  @memo = Memo.find(params[:id])

  halt 404 if @memo.nil?

  erb :show
end

get '/memos/:id/edit' do
  @memo = Memo.find(params[:id])

  halt 404 if @memo.nil?

  erb :edit
end

patch '/memos/:id' do
  @memo = Memo.find(params[:id])

  halt 404 if @memo.nil?

  @memo.title = params[:title]
  @memo.content = params[:content]
  @memo.save

  redirect "/memos/#{params[:id]}"
end

delete '/memos/:id' do
  success = Memo.delete(params[:id])

  if success
    redirect '/memos'
  else
    halt 404
  end
end

not_found do
  erb :not_found
end
