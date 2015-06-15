class SubjectsController < ApplicationController
  def index
    if params[:search]
      @courses = Course.where("course_code LIKE ?", "%#{params[:search]}%")
    end
  end
end
