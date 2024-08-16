class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    #インスタンス変数の定義　プロトタイプの情報を代入
    @prototypes = Prototype.includes(:user)
  end


  def new
    @prototype = Prototype.new
  end


  def create

    #入力項目を代入
    @prototype = Prototype.new(prototype_params)

    #保存できたらtopにリダイレクト。そうでなければ新規投稿ページに戻る
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end


  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end


  def edit
    
  end


  def update
    #データを更新する記述をし、更新されたときはそのプロトタイプの詳細ページに戻る
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      #データが更新されなかったときは、編集ページに戻る
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    #プロトタイプを削除し、トップページに戻る
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
    
  end


  private

  #ストロングパラメータの設定
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  #プロトタイプのID情報を取得
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  #カレントユーザーが読み込んだユーザーと違う場合、TOPページへリダイレクト
  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end

end
