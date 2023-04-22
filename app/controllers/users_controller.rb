class UsersController < ApplicationController
  #本人以外は編集できない
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id]) #ユーザーの取得
    if @user.update(user_params) #ユーザーのアップデート
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id) #userのShowパス
    end
  end
  
  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  #本人以外は編集できない
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
