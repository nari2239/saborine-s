class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @records = @user.records.order("date DESC")
    @record = Record.new
  end
end
