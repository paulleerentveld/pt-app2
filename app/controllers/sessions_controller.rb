class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(name: params[:user][:name])
      user = user.try(:authenticate, params[:user][:password])
      return redirect_to(controller: 'sessions', action: 'new') unless user
      session[:user_id] = user.id
      @user = user
  
      redirect_to controller: 'welcome', action: 'home'
    end

    def createomni
        @omniuser =
          #User.find_or_create_by(uid: auth['uid']) do |u|
           User.find_or_create_by(name: auth['info']['name']) do |u|
            u.name = auth['info']['name']
            u.password = auth['uid']
          end
    
        session[:user_id] = @omniuser.id
        session[:omniauth_data] = request.env['omniauth.auth']
    
        redirect_to controller: 'welcome', action: 'home'
      end
  
    def destroy
      session.delete :user_id
      session[:omniauth_data] = nil
  
      redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

  end