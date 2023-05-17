class UploadsController < ApplicationController

    def create
        @project = Project.find(params[:project_id])
        attachments = Array(params[:upload][:attachments]) # Ensure attachments is an array

        attachments.each do |attachment|
          next if attachment.blank? # Skip empty attachments
    
          @upload = Upload.new(upload_params)
          @upload.attachments.attach(attachment)
          @upload.filename = attachment.original_filename if attachment.respond_to?(:original_filename)
          @upload.content_type = attachment.content_type.to_s if attachment.respond_to?(:content_type)
          @upload.save
        end
      
        if @upload.persisted?
          redirect_to @project, notice: 'Attachment was successfully created.'
        else
          redirect_to @project, alert: 'Failed to create attachment.'
        end
      end

      def show
        @upload = Upload.find(params[:id])
        ActiveStorage::Current.url_options = {
    host: request.base_url,
    protocol: request.protocol
  }
      end
      
    def destroy
        @upload = Upload.find(params[:id])
        @project = @upload.project
      
        if @upload.destroy
          redirect_to @project, notice: 'Attachment was successfully deleted.'
        else
          redirect_to @project, alert: 'Failed to delete attachment.'
        end
    end

    private

    def upload_params
        params.permit(:filename, :content_type, :project_id, uploads: [])
      end
      
end
