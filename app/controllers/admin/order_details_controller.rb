class Admin::OrderDetailsController < ApplicationController

  def update
    ordering_detail=OrderingDetail.find(params[:id])
    ordering_detail.update(ordering_detail_params)
    redirect_to admin_order_path(ordering_detail.id)
  end

  private
  def ordering_detail
    params.require(:ordering_detail).permit(:making_status)
  end
end
