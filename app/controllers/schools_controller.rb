class SchoolsController < ApplicationController
  def index
    @schools = School.all
    @hash = Gmaps4rails.build_markers(@schools) do |school, marker|
      marker.infowindow "<b>#{school.name}</b><p>#{school.address}</p>"
      marker.lat school.latitude
      marker.lng school.longitude
    end
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
