class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :move_to_self_show, only: [:show]

  def show
    @user = User.find(params[:id])
    @records = @user.records.order("date DESC")
    @record = Record.new
  end

  private
  def move_to_self_show
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end
  end
end
