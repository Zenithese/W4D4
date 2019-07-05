class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        render :show
        # @user = User.find_by(id: params[:id])

        # if @user
        #     render :show
        # else
        #     redirect_to user_url
        # end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
