class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @assigned_sites = @user.sites.includes(:lines)
    if @assigned_sites.present?
      @assigned_lines = @assigned_sites.flat_map(&:lines)
      @tasks = Task.where(line_status: @assigned_lines.flat_map(&:status), startable: :can_start)
    else
      flash[:alert] = "You are not assigned to any site."
      redirect_to root_path
    end
  end
end
