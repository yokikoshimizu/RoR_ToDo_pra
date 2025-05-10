class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def create
    @tasks = Task.new(task_params)
    if @tasks.save
      redirect_to tasks_path, notice: "タスクを作成しました"
    else
      render :new
    end
  end

  def update
    @tasks = Task.find(params[:id])
    if @tasks.update(task_params)
      redirect_to(tasks_path, notice: "タスクを更新しました")
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path notice: "タスクを削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:name, :content)
  end
end
