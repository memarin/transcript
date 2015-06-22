class SubjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      @subjects = Subject.where("subject_code LIKE ?", "%#{params[:search]}%")
    end
  end

  def new
    @subject = Subject.new()
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:success] = 'Subject added'
      redirect_to new_subject_path
    else
      flash[:warning] = 'Unable to add subject'
      redirect_to new_subject_path
    end
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      flash[:success] = 'Subject updated'
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end

  private
    def subject_params
      params.require(:subject).permit(:subject_name, :subject_code, :units)
    end
end
