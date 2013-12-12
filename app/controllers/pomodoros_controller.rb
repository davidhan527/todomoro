class PomodorosController < ApplicationController
  respond_to :json
  
  def index
    respond_with Task.all
  end
  
  def show
    respond_with Task.find(params[:id])
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

  private

    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
