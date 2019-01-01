class TopicController < ApplicationController
    
    before_action :move_to_index, except: [:index]
    
    def index
        @topics = Topics.all.order("created_at DESC")
    end
    
    def new
        
    end
    
    def create
        
    end
    
    private
    def move_to_index
        redirect_to action: :index unless user_sign_in?
    end
    
end
