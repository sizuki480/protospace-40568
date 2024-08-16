class UsersController < ApplicationController

  def show
    #インスタンス変数@userを定義。Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを取得。@userに代入
    @user = User.find(params[:id])
  end

end
