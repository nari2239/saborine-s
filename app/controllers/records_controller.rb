class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_current_user, only: [:edit, :update, :search]
  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :move_to_self_show, except: [:index, :create, :search]


  def index
  end

  def create
    @record= Record.new(date: params[:date], time: params[:time], skip: params[:skip], to_do: params[:to_do], user_id: current_user.id)
    if @record.valid?
      @record.save
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = '保存に成功するとマイページに移動します'
      render template: "users/show"
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to user_path(@user)
    else
      flash.now[:alert] = '保存に成功するとマイページに移動します'
      render :edit
    end
  end

  def destroy
    if current_user.id == @record.user_id
      @record.destroy
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def search
    @records = Record.search(params[:start_period], params[:end_period])
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end
  
  private
  def record_params
    params.require(:record).permit(:date, :time, :skip, :to_do).merge(user_id: current_user.id)
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