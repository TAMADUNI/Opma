class AfterSignupController < ApplicationController
    include Wicked::Wizard

    steps :set_department, :set_manager

    def show
        @user = current_user
        render_wizard
      end
    
      def update
        @user = current_user
        @user.update(user_params)
        render_wizard @user
      end
    
      private
    
      def user_params
        params.require(:user).permit(:department)
      end
end
