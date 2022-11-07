module Api
  module V1
    class ActivitiesController < Api::V1::ApiController
      before_action :set_activity, only: %i[show update destroy]
      before_action :auth_activity, only: %i[create show update destroy]

      def index
        @activities = policy_scope(Activity)
      end

      def show; end

      def create
        @activity = current_user.activities.build(activity_params)

        if @activity.save
          render :show
        else
          render json: { errors: @activity.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @activity.update(activity_params_updated)
          render :show
        else
          render json: { errors: @activity.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @activity.destroy!
      end

      def activity_params
        params.require(:activity).permit(:title, :note, :value, :paid, :done_at, :type_a)
      end

      def activity_params_updated
        activity_params.except(:type_a)
      end

      def set_activity
        @activity = current_user.activities.find(params[:id])
      end

      def auth_activity
        authorize @activity || Activity
      end
    end
  end
end
