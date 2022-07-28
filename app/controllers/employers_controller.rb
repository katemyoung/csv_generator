class EmployersController < ApplicationController
  def new
    @employer = Employer.new
  end

  def index
    @employers = Employer.all
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      redirect_to employers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def employer_params
    params.require(:employer).permit(:name, :account_number)
  end
end
