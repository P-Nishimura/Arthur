class TopicController < ApplicationController
    
    before_action :move_to_index, except: [:index]
    
    def index
        @topics = Topic.all.order("created_at DESC")
    end
    
    def new
        
    end
    
    def create
        Topic.create(title: topics_params[:title],detail: topics_params[:detail],user_id: current_user.id )
    end
    
    private
    def topics_params
        params.permit(:title,:detail,:user_id)
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
    
end
