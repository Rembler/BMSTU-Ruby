class TodoerController < ApplicationController
  def index
    @card_plans = Task.where({ owner: current_user.id, group: "В планах" })
    @card_in_work = Task.where({ owner: current_user.id, group: "В работе" })
    @card_done = Task.where({ owner: current_user.id, group: "Выполнено" })
  end

  def warning; end

  def add_task
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.owner = current_user.id
    if @task.save
      redirect_to root_path, notice: "TODO успешно создан!"
    else
      render 'todoer/add_task'
    end
  end

  private

  def task_params
    # params.permit(:title, :content, :is_private, :group)
    params.require(:task).permit(:title, :content, :is_private, :group)
  end
end
