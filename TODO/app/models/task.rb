class Task < ApplicationRecord
  validates :title, presence: true
  validates :group, inclusion: { in: ['В планах', 'В работе', 'Выполнено'] }
  validates :owner, numericality: true, presence: true
end
