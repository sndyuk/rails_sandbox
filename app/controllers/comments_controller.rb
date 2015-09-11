class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy, :approve]

  # POST /comments
  # POST /comments.json
  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new(comment_params.merge(status: 'Unapproved'))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to entry_url(@entry), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to entry_url(@entry) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to entry_url(@comment.entry), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PUT /comments/1/approve
  def approve
    respond_to do |format|
      if @comment.update(status: 'Approved')
        format.html { redirect_to entry_url(@comment.entry), notice: 'Comment was approved.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :status, :entry_id)
    end
end
