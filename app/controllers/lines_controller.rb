class LinesController < ApplicationController
  def index
  end

  def update_line_status
    # Example action to update line status based on maintenance form submission
    line = Line.find(params[:line_id])
    line.update(status: params[:new_status], maintenance_type: params[:maintenance_status])
    # Additional logic to log maintenance details, etc.
  end
end
