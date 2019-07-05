class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end
    
    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = ['Invalid user']
            @user = User.new
            render :new
        end
    end

    def destroy
        @user = User.find_by(session_token: session[:session_token])
        @user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end
end
