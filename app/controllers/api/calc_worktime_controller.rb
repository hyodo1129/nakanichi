# -*- coding: utf-8 -*-
class Api::CalcWorktimeController < ApplicationController
  def calc
    #TODO: 下限時間
    lower_hour = 140 
    render json: { rest_hour: (lower_hour - params[:seisan_hour].to_f), 
                   rest_workday: calc_work_day(Time.parse(params[:current_time]).next_day, params[:salaried])
                 }
  end

  private
  
  def calc_work_day(day, salaried_day_count)
    count = 
      (day.to_date..day.end_of_month.to_date)
        .reject { |m| m.saturday? || m.sunday? || HolidayJp.holiday?(m) }
        .count
    count - salaried_day_count.to_i
  end
end
