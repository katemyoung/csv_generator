class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def employee_params
    params.require(:employee).permit(:surname, :first_name, :ssn, :nrc, :other_name, :dob)
  end
end
