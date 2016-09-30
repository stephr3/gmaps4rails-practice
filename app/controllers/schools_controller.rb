class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:notice] = "You have saved a new school!"
      redirect_to root_path
    else
      flash[:alert] = "You have not saved a new school."
      render :new
    end
  end

  def show
    @school = School.find(params[:id])
  end

private
  def school_params
    params.require(:school).permit(:name, :address)
  end

end
