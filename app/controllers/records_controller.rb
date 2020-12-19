class RecordsController < ApplicationController
  before_action :set_current_user, only: [:edit, :update]
  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_self_show, except: [:index]


  def index
  end

  def create
    # @record = Record.new(time: params[:time], skip: params[:skip], to_do: params[:to_do], user_id: current_user.id)
    @record= Record.new(date: params[:date], time: params[:time], skip: params[:skip], to_do: params[:to_do], user_id: current_user.id)
    if @record.valid?
      @record.save
      redirect_to user_path(current_user)
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
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

  def move_to_self_show
    if current_user.id != @record.user_id
      redirect_to user_path(current_user.id)
    end
  end

  def set_current_user
    @user = User.find(current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end
end