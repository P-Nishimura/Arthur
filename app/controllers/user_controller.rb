class UserController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @topics = @user.topics.all
    end
    
end
