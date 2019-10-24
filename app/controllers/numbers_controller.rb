class NumbersController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  before_action :check_number_format, only: [:create]
  
  def create
    number = Number.generate_phone_number @number
    render status: :ok, json: {
      message: "success",
      number: number.ph_num
    }
  end

  def index 
    numbers = Number.page(params[:page])
    render status: :ok, json: {
      message: "success",
      numbers: numbers.as_json(only: [:ph_num])
    }
  end

  private 

  def check_number_format
    @number = params[:number]
    if @number.present? && @number.length == 10
      front_part = @number[0..2].to_i
      middle_part = @number[3..5].to_i
      end_part = @number[6..9].to_i
      if end_part < 1111 || middle_part < 111 || end_part < 111
        @number = nil
      end
    else
      @number = nil
    end
  end

end