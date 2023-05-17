class CommentsController < ApplicationController
    before_action :set_project
    before_action :set_discussion
    before_action :set_comment, only: [:show, :edit, :update, :destroy]


    def show
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.find(params[:discussion_id])
      @comment = @discussion.comments.find(params[:id])
      end

    def create
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.find(params[:discussion_id])
      @comment = @discussion.comments.new(comment_params.merge(user: current_user))
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @project, notice: 'Message was successfully created.' }
          format.json { render :show, status: :created, location: @discussion }
        else
          puts @comment.errors.full_messages
          format.html { render :new }
          format.json { render json: @discussion.errors, status: :unprocessable_entity }
        end
      end
    end
    

    def new
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.find(params[:discussion_id])
      @comment = @discussion.comments.new
    end
  
    def edit
        @project = Project.find(params[:project_id])
        @discussion = @project.discussions.find(params[:discussion_id])
        @comment = @discussion.comments.find(params[:id])
    end
  
    def update
      @comment = @discussion.comments.find(params[:id])
      
      respond_to do |format|
        if @comment.update(comment_params)
            format.html { redirect_to @project, notice: 'Message was successfully Updated.' }
            format.json { render :show, status: :created, location: @comment }
          else
            format.html { render :new }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
    end
  
    def destroy
      @comment = @discussion.comments.find(params[:id])
      @comment.destroy
      redirect_to project_discussions_path(@project, @discussion), notice: "Message was successfully deleted."
    end
  
    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_discussion
      @discussion = @project.discussions.find(params[:discussion_id])
    end

    def set_comment
      @comment = @discussion.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id).merge(discussion_id: params[:discussion_id], project_id: params[:project_id])
    end
  end
  