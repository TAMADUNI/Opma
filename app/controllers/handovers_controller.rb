class HandoversController < ApplicationController
    def new
        @handover = Handover.new
    end

    def index
        @handovers = Handover.all
    end

    def create
        @handover = Handover.new(handover_params)
        @handover.user_id = current_user.id
        @handover.acceptance_status = :pending
        @handover.save
        redirect_to @handover
    end

    def show 
      @handover = Handover.find(params[:id])
    end

    def accept_handover
      @handover = Handover.find(params[:id])
      @handover.update(acceptance_status: :accepted)
      redirect_to @handover
    end

    def reject_handover
        @handover = Handover.find(params[:id])
        @handover.update(acceptance_status: :rejected, comments: params[:comments])
        redirect_to @handover
    end

    private 
    def handover_params
        params.require(:handover)
        .permit(:user_id, :acceptance_status, :activities, :comments,
        :blob_rates, :ejection_rates, :pending_issues
        )
    end

end
