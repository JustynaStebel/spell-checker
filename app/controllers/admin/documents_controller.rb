class Admin::DocumentsController < ApplicationController
# before_action :authenticate_admin!
def index
  @documents = Document.all
end

def show
  @document = Document.find(params[:id])
  @document_attachments = @document.document_attachments.all
end

def new
  @document = Document.new
  # @document_attachment = @document.document_attachments.build
end

def create
 @document = Document.create(document_params)

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
  @document = Document.find(params[:id])
end

def update
  @document = Document.find(params[:id])
  @document.update!(document_params)
  redirect_to document
end

def destroy
  @document = Document.find(params[:id])
  @document.destroy
  redirect_to documents_path
end


private
 def document_params
    params.require(:document).permit(:name, document_attachments_attributes: [:id, :document_id, :file])
 end
end
