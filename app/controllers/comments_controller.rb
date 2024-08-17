class CommentsController < ApplicationController

  def create

    @comment = Comment.new(comment_params)

    #データが保存されたときは詳細ページにリダイレクト
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      #保存されない場合、値を保持して詳細ページrender
      @prototype = @comment.prototype
      @comments = @prototype.comments

      render "prototypes/show", status: :unprocessable_entity
    end
    
  end


  private

  #ストロングパラメーターをセット user_idとprototype_idもmerge
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end


end
