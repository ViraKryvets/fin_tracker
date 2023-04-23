class ReportsController < ApplicationController
  def index
    
  end

  def report
    if params[:btn_date]
      redirect_to({
        action: "report_by_dates",
        start_date: params[:start_date],
        end_date: params[:end_date]
      })
    elsif
      redirect_to({
        action: "report_by_category",
        start_date: params[:start_date],
        end_date: params[:end_date]
      })
    end
  end


  def report_by_category
    @report_data = Operation.sum_by_category(params[:start_date], params[:end_date])
    @category_name = @report_data.keys
    @category_sum = @report_data.values
  end

  def report_by_dates
    data_by_dates = Operation.sum_by_dates(params[:start_date], params[:end_date])
    @date = data_by_dates.keys.map{|i| i.to_s}
    @date_sum = data_by_dates.values
  end

end
