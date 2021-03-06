class UsersController < ApplicationController

    get '/register' do
        erb :'users/new'
    end

    post '/users' do
        @user = User.create(name: params[:name], last_name: params[:last_name], email: params[:email], password: params[:password])
        
        if @user.save
            redirect "/login"
        else
            erb :'users/new'
        end
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            session["user_id"] = @user.id
            redirect "/users/#{@user.id}"
        else
            erb :'users/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(:email => params[:email])
        
        erb :'users/show'
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end
end
