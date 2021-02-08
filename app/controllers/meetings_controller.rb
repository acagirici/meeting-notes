class MeetingsController < ApplicationController
    
    before '/meetings/*' do
        authentication_required
    end

    get '/meetings' do
        authentication_required
        @meetings = Meeting.all
        erb :'meetings/index'
    end

    get '/meetings/new' do
        erb :'meetings/new'
    end

    post '/meetings' do
        @meeting = Meeting.create(name: params[:name], date: params[:date], user_id: current_user.id, subject: params[:subject], note: params[:note], assignment: params[:assignment])
        redirect "/meetings/#{@meeting.id}"
    end

    get '/meetings/:id' do
        @meeting = Meeting.find(params[:id])
        erb :'/meetings/show'
    end

    get '/meetings/:id/edit' do
        @meeting = Meeting.find(params[:id])

        if edit_authorization(@meeting)
            erb :'/meetings/edit'
        else
            redirect 'users/#{curent_user.id}'
        end
    end

    patch '/meetings/:id' do
        @meeting = Meeting.find(params[:id])
        @meeting.update(name: params[:name], date: params[:date], user_id: current_user.id, subject: params[:subject], note: params[:note], assignment: params[:assignment])
        
        redirect "/meetings/#{@meeting.id}"
    end

    delete "/meetings/:id" do
        Meeting.destroy(params[:id])
        flash[:message] = "Meeting Seccessfully Deleted!"
        redirect '/meetings'
    end
    
end