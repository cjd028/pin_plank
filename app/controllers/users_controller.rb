class UsersController < ApplicationController

   def create
    @user = User.new(user_params)
  
    if @user.save
      log_in @user
      redirect_to pins_path(current_user.id)
    else
      render template: "users/new", notice: @user.errors.full_messages.first
      end
    end


  def show
    @user = User.find_by_id(params[:id])
  end
  
  def new
    @user = User.new
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_pin_path
    else
      render 'edit'
    end
  end

  def search
    @user = User.find_by_email(params[:search_email])
    render 'search'
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end