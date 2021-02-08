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
    # @student = Student.new(first_name: params[:student][:first_name], last_name: params[:student][:last_name])

    params.require(:student).permit(:first_name, :last_name)
    @student = Student.name(params)

    #

    if @student.save
      redirect_to student_path(@student)
    end
  end

end
