class UsersController < ApplicationController

  def index
    @users = User.sorted
    render('index')
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new({:first_name => 'Enter First Name', :last_name => 'Enter Last Name'})
  end

  # no view so manually created
  def create
    # Instantiate a new object using form parameters
    # use parameter for whitelisting
    @user = User.new(user_params)

    # Save the object
    if @user.save
      # If save succeeds, redirect to the index action
      redirect_to(users_path)
    else
      # if save fails, redisplay the form so user can fix problems
      # redisplay the form -- not calling new action
      render('new')
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  # no view so manually created
  def update
    # copy of create code but we have to load the user
    # Instantiate a new object using form parameters
    # use parameter for whitelisting
    @user = User.find(params[:id])

    # Save the object
    if @user.update_attributes(user_params)
      # If save succeeds, redirect to the index action
      redirect_to(user_path(@user))
    else
      # if save fails, redisplay the form so user can fix problems
      # redisplay the form -- not calling new action
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  # no view so manually created
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_path)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
