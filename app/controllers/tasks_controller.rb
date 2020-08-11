class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    #I can list tasks
    @tasks = Task.all
  end

  def show
     #I can view the details of a task
     # @task = Task.find(params[:id])
  end

  def new
     #creer une nouvelle task
      @task = Task.new
  end

  def create
    #I can add a new task
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end


  def edit
    #get the form pre rempli pour l'editer
    # @task = Task.find(params[:id])

  end

  def update
    #I can update new task
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)

  end

  def destroy
  #   # I can delete new task par id
  # @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
   @task = Task.find(params[:id])
  end
end

