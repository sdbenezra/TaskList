class TasksController < ApplicationController
  TASKS = [
    {task: "Feed the dog", detail: "Use the chicken in the fridge"},
    {task: "Take out the trash", detail: "by Tuesday"},
    {task: "Do homework", detail: "due Thursday"},
    {task: "Make dinner", detail: "defrost roast"}
  ]

  def index
    @tasks = TASKS
  end

  def show
    task_id = params[:id].to_i
    @tasks = TASKS[task_id]
    if @tasks.nil?
      head :not_found
    end
  end
end
