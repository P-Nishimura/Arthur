class TopicController < ApplicationController
    
    before_action :move_to_index, except: [:index,:show]
    
    def index
        @topics = Topic.all.order("created_at DESC")
    end
    
    def new
        
    end
    
    def create
        @topic = Topic.create(title: topics_params[:title],detail: topics_params[:detail],user_id: current_user.id )
        redirect_to "/topic/#{@topic.id}"
    end
    
    def show
        @topics = Topic.find(params[:id])
        if user_signed_in? && current_user.id ==! @topics.user.id
            redirect_to action: :index unless @topics.open_or_close? 
        end
        @opinions = @topics.opinions.all
    end
    
    def destroy
        topic = Topic.find(params[:id])
        topic.destroy if topic.user.id == current_user.id
        redirect_to "/user/#{topic.user.id}"
    end
    
    def update
        topic = Topic.find(params[:id])
        topic.update(update_topic_params)
    end
    
    private
    def topics_params
        params.permit(:title,:detail,:user_id)
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
    
    def update_topic_params
        params.permit(:open_or_close?)
    end
    
end
