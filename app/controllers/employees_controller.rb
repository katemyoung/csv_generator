class EmployeesController < ApplicationController
  before_action :get_employer

  def new
    @employee = @employer.employees.build
  end

  def index
    @employees = @employer.employees
  end

  def create
    @employee = @employer.employees.build(employee_params)
    if @employee.save
      redirect_to employer_employees_path(@employer), notice: 'Employee was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def get_employer
    @employer = Employer.find(params[:employer_id])
  end

  def employee_params
    params.require(:employee).permit(:surname, :first_name, :ssn, :nrc, :other_name, :dob)
  end
end
