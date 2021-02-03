class MeetingsController < ApplicationController
    
    before '/meetings/*' do
        authentication_required
    end

    get '/meetings' do
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
        set_meeting
        erb :'/meetings/show'
    end

    private

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
    
end
