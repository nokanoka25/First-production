class SchedulesController < ApplicationController
  before_action :set_group
  before_action :set_schedule, only: [:edit, :update, :destroy]

  def index
     @schedules = @group.schedules.order(scheduled_at: :asc) # 日時順
  end
  
  def new
    @schedule = @group.schedules.new
  end
  
  def create
    @schedule = @group.schedules.new(schedule_params)
    if @schedule.save
      redirect_to group_schedules_path(@group), notice: '予定が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to group_schedules_path(@group), notice: '予定が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    redirect_to group_schedules_path(@group), notice: '予定が削除されました。'
  end
  
  private
  
  def set_group
    @group = Group.find(params[:group_id])
  end
  
  def schedule_params
    params.require(:schedule).permit(:name, :scheduled_at)
  end

  def set_schedule
    @schedule = @group.schedules.find(params[:id])
  end
  
end
