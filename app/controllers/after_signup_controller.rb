class AfterSignupController < ApplicationController
    include Wicked::Wizard

    steps :personal_info, :set_department

      def show
        @user = current_user
        @departments = Department.all
        render_wizard
      end
    
      def update
        @user = current_user
        if params[:user][:department_id].present? || step == :department_info
          @user.update(user_params)
        else
          @user.update(user_params.except(:department_id))
        end
        render_wizard @user
      end
    
      private
    
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :department_id)
      end
end
