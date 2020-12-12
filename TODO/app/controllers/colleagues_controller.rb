class ColleaguesController < ApplicationController
  def index
    @colleagues = User.all.reject { |elem| elem.id == current_user.id }
  end

  def colleague
    @colleague = User.find(params[:id])
    all_tasks
  end

  private

  def all_tasks
    @card_plans = Task.where({ owner: @colleague.id, group: 'В планах', is_in_trash: false, is_private: false })
    @card_in_work = Task.where({ owner: @colleague.id, group: 'В работе', is_in_trash: false, is_private: false })
    @card_done = Task.where({ owner: @colleague.id, group: 'Выполнено', is_in_trash: false, is_private: false })
  end
end
