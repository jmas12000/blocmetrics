class RegisteredApplicationsController < ApplicationController
  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events
  end
  
  def new
    @registered_application = RegisteredApplication.new
  end
    
  def create
    @user = User.find(params[:user_id]) 
    @registered_application = @user.registered_applications.new(registered_application_params)
   
    if @registered_application.save
      flash[:notice] = "Application registered successfully."
    redirect_to [@user,@registered_application]
    else
      flash[:alert] = "Application failed to register."
      redirect_to root_path
    end 
  end 
  
  def destroy
    @user = User.find(params[:user_id])
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Application de-registered successfully"
    else
      flash[:alert] = "Application couldn't be de-registered successfully. Please try again."
    end
   
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
