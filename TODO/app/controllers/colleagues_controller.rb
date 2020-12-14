# frozen_string_literal: true

# class responsible for list of users and showing one user
class ColleaguesController < ApplicationController
  before_action :check_colleague, only: :colleague

  def index
    @colleagues = User.all.reject { |elem| elem.id == current_user.id }
  end

  def colleague
    all_tasks
  end

  def not_found; end

  def info; end

  private

  def check_colleague
    @colleague = User.find_by(id: params[:id])
    if @colleague.nil?
      redirect_to not_found_path
    elsif @colleague.id == current_user.id
      redirect_to root_path
    end
  end

  def all_tasks
    @card_plans = Task.where({ owner: @colleague.id, group: 'В планах', is_in_trash: false, is_private: false })
    @card_in_work = Task.where({ owner: @colleague.id, group: 'В работе', is_in_trash: false, is_private: false })
    @card_done = Task.where({ owner: @colleague.id, group: 'Выполнено', is_in_trash: false, is_private: false })
  end
end
