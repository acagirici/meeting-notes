require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "planning_t00L"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user
      #converting a truthy or falsey to actual true or false with double bang
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
      #memoziation pattern. Either a user intance or nil will be returned. 
    end
  end

end
    