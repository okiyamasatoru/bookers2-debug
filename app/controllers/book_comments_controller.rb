class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(post_comment_params)
    comment.book_id = book.id
    if comment.save
    redirect_back(fallback_location: root_path)
    else
    redirect_back(fallback_location: root_path)    
    end
  end
  def destroy
   BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
   redirect_back(fallback_location: root_path)
  end
   private

  def post_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
