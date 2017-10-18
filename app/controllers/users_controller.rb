class UsersController < ApplicationController

  def index
    @users = User.sorted
    render('index')
  end

  def show
  end

  def new
  end

  # no view so manually created
  def created
  end

  def edit
  end

  # no view so manually created
  def updated
  end

  def delete
  end

  # no view so manually created
  def destroy
  end

  private

end
