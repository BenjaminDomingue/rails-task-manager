# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    title = params['task'][:title]
    details = params['task'][:details]
    new_task = Task.new(title: title, details: details)
    new_task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    title = params['task'][:title]
    details = params['task'][:details]
    completed = params['task'][:completed]
    @task.update(title: title, details: details, completed: completed)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
