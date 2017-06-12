class RegisteredApplicationsController < ApplicationController
  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def index
    @registered_applications = RegisteredApplication.all
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.URL = params[:registered_application][:URL]

    if @registered_application.save
      flash[:notice] = "Site was saved!!!"
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again. #{@registered_application.errors.full_messages}"
      render :new
    end
  end

  def update
      @registered_application = RegisteredApplication.find(params[:id])
      @registered_application.name = params[:registered_application][:name]
      @registered_application.URL = params[:registered_application][:URL]

      if @registered_application.save
        flash[:notice] = "Site was saved!!!"
        redirect_to @registered_application
      else
        flash.now[:alert] = "There was an error saving the wiki. Please try again. #{@registered_application.errors.full_messages}"
        render :new
      end
    end

    def destroy
      @registered_application = RegisteredApplication.find(params[:id])

      if @registered_application.destroy
        flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
        redirect_to registered_applications_path
      else
        flash.now[:alert] =j "There was an error deleting the post."
        render :show
      end
    end
end
