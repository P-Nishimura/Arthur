class OpinionController < ApplicationController
    
    def create
        @opinion = Opinion.create(content: opinion_params[:content], user_id: current_user.id, topic_id: opinion_params[:topic_id])
        redirect_to "/topic/#{@opinion.topic.id}"
    end
    
    def destroy
        opinion = Opinion.find(params[:id])
        opinion.destroy if current_user.id==opinion.user.id
        redirect_to "/topic/#{opinion.topic_id}"
    end
    
    private
    def opinion_params
        params.permit(:content, :topic_id)
    end
end
