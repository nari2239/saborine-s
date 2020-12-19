class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @records = @user.records.order("date DESC")
    @record = Record.new
  end
end
