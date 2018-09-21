class TasksController < ApplicationController
  # TASKS = [
  #   {task: "Feed the dog", detail: "Use the chicken in the fridge"},
  #   {task: "Take out the trash", detail: "by Tuesday"},
  #   {task: "Do homework", detail: "due Thursday"},
  #   {task: "Make dinner", detail: "defrost roast"}
  # ]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(
    #   action: params[:task][:action],
    #   description: params[:task][:description],
    #   completion_date: params[:task][:completion_date]
    # )
    @task = Task.new(task_params)

    is_successful_save = @task.save

    if is_successful_save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    # task.action = params[:task][:action]
    # task.description = params[:task][:description]
    # task.completion_date = params[:task][:completion_date]
    task.update(task_params)

    if task.update
      redirect_to task_path
    else
      render :edit
    end
    redirect_to task_path(task.id)
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    return params.require(:task).permit(:action, :description, :completion_date)
  end

end
