class DocumentAttachmentsController < DocumentsController

  def check_correctness
    @document = current_user.documents.find(params[:document_id])
    @document_attachment = @document.document_attachments.find(params[:id])
    checker = WordChecker.new(params)
    @incorrect_word = checker.perform
    render "check_correctness"
  end

  private
  def document_attachment_params
    params.require(:document_attachment).permit(:document_id, :file)
  end
end
