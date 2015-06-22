class StudentsController < ApplicationController
  def index

  end

  def new
    @student = Student.new
  end

  def create

  end

  private
    def student_params
      params.require(:student).permit(:student_number,
                                      :first_name,
                                      :middle_name,
                                      :last_name,
                                      :address,
                                      :birthday,
                                      :birthplace)
    end

end
