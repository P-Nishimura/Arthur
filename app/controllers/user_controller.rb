class UserController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @topics = @user.topics.all.order("created_at DESC")
    end
    
    def edit
    end
    
    def update
    end
    
end
