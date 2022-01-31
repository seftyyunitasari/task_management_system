class TaskLabel < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :label
end
