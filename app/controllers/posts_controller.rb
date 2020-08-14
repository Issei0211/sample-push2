class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user,{only:[:edit, :update, :destroy]}

  # ページネーションによる1ページの投稿限度数
  PER = 10

  def index
    # 新しい投稿が上から順に表示
    @posts = Post.page(params[:page]).per(PER).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    # フォームから送信されたデータを受け取る
    @post = Post.new(content: params[:content], user_id: @current_user.id)

    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")    # 保存できたとき、投稿一覧ページへ
    else
      render("posts/new")   # 保存できなかったとき、新規投稿ページへ
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

    if params[:image]
      @post.image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image}", image.read)
    end
    
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")    # 保存できたとき、投稿一覧ページへ
    else
      render("posts/edit")    # 保存できなかったとき、投稿編集ページへ
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    
    if @current_user.admin == false
      if @post.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
      end
    end
  end

  def search
    @posts = Post.search(params[:search])
  end
end
