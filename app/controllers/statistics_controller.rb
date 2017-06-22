class StatisticsController < ApplicationController
  before_action :auth_user
  
  def index
    if params[:date1].nil? || params[:date2].nil?
      flash[:notice] = "Obtain the statistics between the two following dates:"
    else
      if params[:date1].empty? || params[:date2].empty?
        redirect_to statistics_path, notice: 'Enter the missing date.'
      else
        @date1 = Date.strptime(params[:date1], '%m/%d/%Y')
        @date2 = Date.strptime(params[:date2], '%m/%d/%Y')
        @chart_data = Event.where(:created_at => @date1..@date2).group(:event_type).count.map {|k, v| [k.humanize, v]}
        @chart_data2 = Task.where(:start_date => @date1..@date2).group(:user).count.map {|k, v| [k.email, v]}
      end
    end
  end
  
  private
    def auth_user
      redirect_to root_path unless current_user
    end
end
