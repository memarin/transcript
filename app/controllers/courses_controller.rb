class CoursesController < ApplicationController

  def show
    @course = Course.find(params[:id])
  end

  def index
    if params[:search]
      @courses = Course.where("course_code LIKE ?", "%#{params[:search]}%")
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:success] = 'Course added'
      redirect_to new_course_path
    else
      flash[:danger] = 'Unable to add course'
      redirect_to new_course_path
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      flash[:success] = 'Course updated'
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def delete

  end

  def destroy

  end

  private
    def course_params
      params.require(:course).permit(:course_code, :course_name)
    end
end
