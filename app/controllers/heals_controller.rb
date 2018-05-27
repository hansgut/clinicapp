class HealsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @heal = @list.heals.create(heal_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @heal = @list.heals.find(params[:id])
    @heal.destroy
    redirect_to list_path(@list)
  end

  private
  def heal_params
    params.require(:heal).permit(:doctor_id, :content)
  end
end
