class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    #@articles = @user.articles
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Usuario #{@user.username} creado satisfactoriamente"
    #redirect_to article_path(@article)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Información actualizada satisfactoriamente'
      #redirect_to article_path(@article)
      redirect_to @user
    else
      render 'edit'
    end

  end

  def destroy
    # @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "La cuenta y todos sus articulos relacionas eliminados correctamente"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "Solo puedes modificar tu perfil"
      redirect_to @user
    end
  end
   
end