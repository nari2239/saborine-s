class RecordsController < ApplicationController
  def index
  end

  def create
    # binding.pry
    # @record = Record.new(time: params[:time], skip: params[:skip], to_do: params[:to_do], user_id: current_user.id)
    @record= Record.new(time: params[:time], skip: params[:skip], to_do: params[:to_do], user_id: current_user.id)
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
    @user = User.find(current_user.id)
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    if current_user.id == @record.user_id
      @record.destroy
      redirect_to user_path(current_user)
    else
      redirect_to 
    end
  end

  private
  def record_params
    params.require(:record).permit(:time, :skip, :to_do).merge(user_id: current_user.id)
  end
end