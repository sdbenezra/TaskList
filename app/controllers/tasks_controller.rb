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

  def edit
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    task.action = params[:task][:action]
    task.description = params[:task][:description]
    task.completion_date = params[:task][:completion_date]
    task.update(action: task.action, description: task.description, completion_date: task.completion_date)
    # IMPLEMENT CHECK FOR NO UPDATE LIKE BELOW
    # if @task.save
    #   redirect_to task_path
    # else
    #   render :edit
    # end
    redirect_to task_path(task.id)
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to tasks_path
  end

end
