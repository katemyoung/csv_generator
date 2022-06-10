class EmployersController < ApplicationController
  def new
    @employer = Employer.new
  end

  def index
    @employers = Employer.all
  end 

  def create
    @employer = Employer.new(name: params[:employer][:name], account_number: params[:employer][:account_number])
    if @employer.save
      redirect_to employers_path
    else 
      render :new, status: :unprocessable_entity
    end
  end
end
