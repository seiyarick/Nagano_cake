class Admin::OrderDetailsController < ApplicationController
  
  def update
  
  end
  
  private
  def ordering_detail
    params.require(:ordering_detail).permit(:making_status)
  end  
end
