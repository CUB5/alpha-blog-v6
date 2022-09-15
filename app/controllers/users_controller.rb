class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Información actualizada satisfactoriamente'
      #redirect_to article_path(@article)
      redirect_to @user
    else
      render 'edit'
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Usuario #{@user.username} creado satisfactoriamente"
    #redirect_to article_path(@article)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
   
end