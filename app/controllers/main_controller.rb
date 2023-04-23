class MainController < ApplicationController
  def index
    data_from_begin_month = Operation.expens_from_begin_month
    @date_current_month = data_from_begin_month.keys.map{|i| i.to_s}
    @date_sum_curr_month = data_from_begin_month.values
    @income_from_begin_month = Operation.income_from_begin_month
  end
end
