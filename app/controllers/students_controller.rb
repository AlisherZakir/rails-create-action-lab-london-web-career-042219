class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def create
    params[:student] ||= {}
    if params[:student].empty?
      params[:student] = {first_name: params[:first_name], last_name: params[:last_name]}
    end
    student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
    redirect_to student_path(student)
  end

end
