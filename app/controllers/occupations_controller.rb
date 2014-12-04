class OccupationsController < ApplicationController
  def new
    @occupation = Occupation.new
  end

  def create
    @occupation = Occupation.new(occupation_params)

    if @occupation.save
      redirect_to root_path
    else
      flash[:notice] = @occupation.errors.full_message.to_sentence
      render :new
    end
  
  end

  private

  def occupation_params
    params.require(:occupation).permit(:title, :user_id)
  end
end