class LogsController < ApplicationController
  before_action :set_log, only: [:destroy]

  # GET /logs
  # GET /logs.json
  def index
    if params[:device_id].present?
      @device = Device.find(params[:device_id])
      @logs = @device.logs
    else
      @logs = Log.all.includes(:device)
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:device_id)
    end
end
