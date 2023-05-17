class DiscussionsController < ApplicationController
    before_action :set_project
    before_action :set_discussion, only: [:show, :edit, :update, :destroy]
    before_action :authorize_admin, except: [:show, :index]


    def index
        @discussions = @project.discussions.all
      end 

    def show
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.find(params[:id])
      @comment = @discussion.comments.new
      end

    def create
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.new(discussion_params)
      @discussion.user = current_user

      respond_to do |format|
        if @discussion.save
          format.html { redirect_to @project, notice: 'Thread was successfully created.' }
          format.json { render :show, status: :created, location: @discussion }
        else
          format.html { render :new }
          format.json { render json: @discussion.errors, status: :unprocessable_entity }
        end
      end
    end
    def new
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.new(id: params[:id])
    end

    def edit
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.find(params[:id])
    end

    def update
      @project = Project.find(params[:project_id])
      @discussion = @project.discussions.find(params[:id])
        respond_to do |format|
            if @discussion.update(discussion_params)
              format.html { redirect_to @project, notice: 'Thread was successfully updated.' }
              format.json { render :show, status: :ok, location: @discussion }
            else
              format.html { render :edit }
              format.json { render json: @discussion.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy
        @project = Project.find(params[:project_id])
        @discussion = @project.discussions.find(params[:id])
          @discussion.destroy
          respond_to do |format|
            format.html { redirect_to project_discussions_path, notice: 'Thread was successfully destroyed.' }
            format.json { head :no_content }
          end
    end

    private 

    def set_project
      @project = Project.find(params[:project_id])
    end
    
    def set_discussion
        @discussion = @project.discussions.find(params[:id])
    end

    def discussion_params
        params.require(:discussion).permit(:body, :project_id, :user_id)
    end

    def authorize_admin
      unless current_user.admin?
        redirect_to projects_path, notice: "You are not authorized to perform this action."
      end
    end
end
