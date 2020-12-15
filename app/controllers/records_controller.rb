class RecordsController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def create
    # binding.pry
    # @record = Record.new(time: params[:time], skip: params[:skip], to_do: params[:to_do], user_id: current_user.id)
    @record= Record.new(record_params)
    if @record.valid?
      @record.save
      redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find(current_user.id)
    @record = Record.find(params[:id])
  end

  def update
  end

  private
  def record_params
    params.permit(:time, :skip, :to_do).merge(user_id: current_user.id)
  end
end