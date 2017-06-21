class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.comments.create(
      body: comment_params[:body],
      commenter: user_info[:login]
    )
    redirect_to event_path(@event)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
