class DocumentsController < ApplicationController
before_action :authenticate_user!

  def index
    @documents = current_user.documents
  end

  def show
    @document = current_user.documents.find(params[:id])
    @document_attachments = @document.document_attachments.all
  end

  def new
    @document = current_user.documents.build
    @document_attachment = @document.document_attachments.build
  end

  def create
   @document = current_user.documents.build(document_params)

   respond_to do |format|
     if @document.save
       params[:document_attachments]['file'].each do |f|
          @document_attachment = @document.document_attachments.create!(:file => f)
       end
       format.html { redirect_to @document, notice: 'Document was successfully created.' }
     else
       format.html { render action: 'new' }
     end
   end
 end

  def edit
    @document = current_user.documents.find(params[:id])
  end

  def update
    @document = current_user.documents.find(params[:id])
    @document.update!(document_params)
    redirect_to document
  end

  def destroy
    @document = current_user.documents.find(params[:id])
    @document.destroy
    redirect_to documents_path
  end


 private
   def document_params
      params.require(:document).permit(:name, document_attachments_attributes: [:id, :document_id, :file])
   end
end
