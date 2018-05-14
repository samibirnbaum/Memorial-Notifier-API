class Api::MemorialNoticesController < ApplicationController
    
    before_action :authenticate_user!

    def create
        @memorial_notice = MemorialNotice.new(allowed_params)
        @memorial_notice.user = current_user
        if @memorial_notice.save
            render json: @memorial_notice, root: "memorial_notice", status: 201
        else
            render json: { errors: @memorial_notice.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        @memorial_notices = MemorialNotice.order(:last_name, :first_name)
        render json: @memorial_notices, each_serializer: MemorialNoticeSerializer
    end

    def show
        @memorial_notice = MemorialNotice.find(params["id"])
        render json: @memorial_notice, root: "memorial_notice"
    end

    private
    def allowed_params
        params.require(:memorial_notice).permit!
    end 
end
