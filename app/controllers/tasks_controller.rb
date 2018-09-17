class TasksController < ApplicationController
  def index
    @tasks = ["Feed the dog", "Take out the trash", "Do homework", "Make dinner"]
  end
end
