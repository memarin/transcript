class SubjectsController < ApplicationController
  def index
    if params[:search]
      @subject = Subject.where("subject_code LIKE ?", "%#{params[:search]}%")
    end
  end

  def new
    @subject = Subject.new()
  end

  def create
    @subject = Subject.new()
  end

  private
    def subject_params
      params.require(:subject).permit(:subject_name, :subject_code, :units)
    end
end
