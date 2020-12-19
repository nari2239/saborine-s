class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]
  before_action :move_to_self_show, only: [:show]

  def show
    @records = @user.records.order("date DESC")
    @record = Record.new
  end

  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def move_to_self_show
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end
  end
end
