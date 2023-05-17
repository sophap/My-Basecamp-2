class Discussions::CommentsController < ApplicationController
    def index
    end

    def new
        @discussion = Discussion.find(params[:parent_id])
        @discussion = @discussion.comments.new(comment_params)
    end

    def create
        @discussion = Discussion.find(params[:parent_id])
        @comment = @discussion.comments.new(comment_params)
        @comment.user_email = current_user.email
    
        if @comment.save
          redirect_to project_discussions_path, notice: "Message was successfully created."
        else
          render :new
        end
    end
    def show
    end
    
    def edit
        @discussion = Discussion.find(params[:parent_id])
        @comment = @discussion.comments.find(params[:id])
    end

    def update
        @discussion = Discussion.find(params[:parent_id])
        @comment = @discussion.comments.find(params[:id])
    
        if @comment.update(comment_params)
          redirect_to project_discussions_path, notice: "Message was successfully updated."
        else
          render :edit
        end
    end

    def destroy
        @discussion = Discussion.find(params[:parent_id])
        @comment = @discussion.comments.find(params[:id])
        @comment.destroy
        redirect_to project_discussions_path, notice: "Message was successfully deleted."
    end
    private

    def comment_params
        params.require(:comment).permit(:body, :parent_id)
    end

end
