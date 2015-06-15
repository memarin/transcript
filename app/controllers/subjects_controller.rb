class SubjectsController < ApplicationController
  def index
    if params[:search]
      @subject = Subject.where("subject_code LIKE ?", "%#{params[:search]}%")
    end
  end
end
