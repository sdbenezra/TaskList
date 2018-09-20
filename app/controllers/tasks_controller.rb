class TasksController < ApplicationController
  # TASKS = [
  #   {task: "Feed the dog", detail: "Use the chicken in the fridge"},
  #   {task: "Take out the trash", detail: "by Tuesday"},
  #   {task: "Do homework", detail: "due Thursday"},
  #   {task: "Make dinner", detail: "defrost roast"}
  # ]

  TASKS = Task.all

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

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      action: params[:task][:action],
      description: params[:task][:description],
      completion_date: params[:task][:completion_date]
    )

    is_successful_save = @task.save

    if is_successful_save
      redirect_to tasks_path
    else
      render :new
    end
  end
end
