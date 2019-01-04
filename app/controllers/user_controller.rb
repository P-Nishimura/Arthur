class UserController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @topics = @user.topics.all.order("created_at DESC")
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        current_user.update(update_params)
        redirect_to "/user/#{current_user.id}"
    end
    
    private
    def update_params
        params.require(:user).permit(:nickname,:reason)
    end
end
