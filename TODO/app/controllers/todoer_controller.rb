# frozen_string_literal: true

# main logic controller
class TodoerController < ApplicationController
  before_action :set_task, only: %i[destroy move_to to_trash edit update]

  def index
    all_tasks false
  end

  def warning; end

  def add_task
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.owner = current_user.id
    @task.is_in_trash = false
    if @task.save
      redirect_to root_path, notice: 'TODO успешно создан!'
    else
      render 'todoer/add_task'
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to trash_can_path }
      format.js { render 'to_trash' }
    end
  end

  def clear_trash
    Task.where(is_in_trash: true).destroy_all
    respond_to do |format|
      format.html { redirect_to trash_can_path, notice: 'Корзина очищена!' }
      format.js
    end
  end

  def to_trash
    @task.update is_in_trash: !@task.is_in_trash
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def edit; end

  def update
    # if Task.find(params[:id]).update(task_params)
    if @task.update(task_params)
      redirect_to root_path, notice: 'TODO успешно обновлен!'
    else
      render 'todoer/edit'
    end
  end

  def trash_can
    all_tasks true
  end

  def move_to
    set_new_group
    @task.update group: @group
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def all_tasks(status)
    @card_plans = Task.where({ owner: current_user.id, group: 'В планах', is_in_trash: status })
    @card_in_work = Task.where({ owner: current_user.id, group: 'В работе', is_in_trash: status })
    @card_done = Task.where({ owner: current_user.id, group: 'Выполнено', is_in_trash: status })
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :is_private, :group)
  end

  def update_params
    [:params[:title, :content, :is_private, :group]]
  end

  def set_new_group
    case @task.group
    when 'В планах'
      @group = 'В работе'
      @group_id = 'in_work'
    when 'В работе'
      @group = 'Выполнено'
      @group_id = 'done'
    else
      @group = @task.group
    end
  end
end
