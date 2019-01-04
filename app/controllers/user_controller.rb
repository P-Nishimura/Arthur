class UserController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @topics = @user.topics.all
    end
    
    def edit
    end
    
    def update
    end
    
end
