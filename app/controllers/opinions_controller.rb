class OpinionsController < ApplicationController
    
    def create
        Opinion.create(content: opinion_params[:content], user_id: current_user.id, topic_id: opinion_params[:topic_id])
        topic = Topic.find(params[:topic_id])
        @opinions = topic.opinions.all
    end
    
    def destroy
        opinion = Opinion.find(params[:id])
        opinion.destroy if current_user.id==opinion.user.id
        redirect_to "/topic/#{opinion.topic_id}"
    end
    
    def update
        opinion = Opinion.find(params[:id])
        opinion.update(update_opinion_params)
        redirect_to "/topic/#{opinion.topic.id}"
    end
    
    private
    def opinion_params
        params.permit(:content, :topic_id)
    end
    
    def update_opinion_params
        params.permit(:unfortunate)
    end
end
