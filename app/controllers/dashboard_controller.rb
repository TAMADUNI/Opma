class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @assigned_site = @user.site_id
    @assigned_lines = @assigned_site.lines
    @tasks = Task.where(line_status: @assigned_lines.pluck(:status), startable: :can_start)
  end
end
