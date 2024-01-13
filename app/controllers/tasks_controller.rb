class TasksController < ApplicationController
  before_action :authenticate_user!

  def start
    task = Task.find(params[:id])
    work_session = current_user.work_sessions.create(task: task, started_at: Time.current)
    task.start!
    redirect_to root_path, notice: 'Task started successfully!'
  end

  def complete
    task = Task.find(params[:id])
    work_session = current_user.work_sessions.find_by(task: task)
    work_session.update(completed_at: Time.current)
    task.complete!
    redirect_to root_path, notice: 'Task completed successfully!'
  end
end
