class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
      @user = User.find_by(name: params[:user][:name])
        if !!@user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
            "you have entered the wrong user name or password"
            render :new 
        end
    end

    def destroy
      session.delete :user_id
      redirect_to root_path
    end
end