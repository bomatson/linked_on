class OccupationsController < ApplicationController

  before_action :authorize, only: [:create]

  def new
    @occupation = Occupation.new
  end

  def create
    @occupation = Occupation.new(occupation_params)
    
    @occupation.users << User.find(params[:user_id])

    if @occupation.save
      redirect_to root_path
    else
      flash[:notice] = @occupation.errors.full_message.to_sentence
      render :new
    end
  
  end

  private

  def occupation_params
    params.require(:occupation).permit(:title)
  end
end