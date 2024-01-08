class HandoversController < ApplicationController
    def new
        @handover = Handover.new
    end

    def index
      @handovers = current_user.site.handovers.pending
    end

    def create
        @handover = Handover.new(handover_params)
        @handover.user_id = current_user.id
        @handover.acceptance_status = :pending
        @handover.save
        redirect_to handovers_path
    end

    def show 
      @handover = Handover.find(params[:id])
    end

    def accept
      @handover = Handover.find(params[:id])
      @handover.update(status: :accepted)
      redirect_to @handover
    end

    def reject
        @handover = Handover.find(params[:id])
        @handover.update(status: :rejected, comments: params[:comments])
        redirect_to @handover
    end

    private 
    def handover_params
        params.require(:handover)
        .permit(:user_id, :status, :activities, :comments,
        :blob_rates, :ejection_rates, :pending_issues, :site_id
        )
    end

end
