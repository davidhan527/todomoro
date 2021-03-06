class TasksController < ApplicationController
  respond_to :json
  
  def index
    respond_with Task.all
  end
  
  def show
    respond_with Task.find(params[:id]).pomodoros
  end

  def create
    task = Task.create(task_params)
    current_user.tasks << task
    respond_with task
  end
  
  def update
    respond_with Task.update(params[:id], task_params)
  end
  
  def destroy
    respond_with Task.destroy(params[:id])
  end

  def pomodorocreate
    pomodoro = Task.find(params[:id]).pomodoros.create
    count = Task.find(params[:id]).pomodoros.count
    render :json => {count: count}
  end

  def pomodorocount
    count = Task.find(params[:id]).pomodoros.count
    render :json => {count: count}
  end

  private

    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
