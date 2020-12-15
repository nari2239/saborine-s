class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @records = @user.records.order("created_at DESC")
    @record = Record.new
  end
end
