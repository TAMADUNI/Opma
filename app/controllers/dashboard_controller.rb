class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @assigned_site = @user.site
    @assigned_lines = @assigned_site.lines
    @tasks = @assigned_lines.where(line_status: @assigned_lines.pluck(:status)
  end
end
