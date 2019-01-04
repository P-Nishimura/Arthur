class TopicController < ApplicationController
    
    before_action :move_to_index, except: [:index,:show]
    
    def index
        @topics = Topic.all.order("created_at DESC")
    end
    
    def new
        
    end
    
    def create
        @topic = Topic.create(title: topics_params[:title],detail: topics_params[:detail],user_id: current_user.id )
        redirect_to "/"
    end
    
    def show
        @topics = Topic.find(params[:id])
        redirect_to action: :index unless @topics.open_or_close? 
        @opinions = @topics.opinions.all
    end
    
    private
    def topics_params
        params.permit(:title,:detail,:user_id)
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
    
end
