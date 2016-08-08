class DirectionsController < ApplicationController
	
  def index
  	@directions = Direction.all.order("created_at ASC");
  end

  def new
    @direction = Direction.new
  end

  def create
    @direction = Direction.new(direction_params)
    @direction.user = current_user
    if @direction.save
      redirect_to directions_path, notice: "La Dirección fue creada exitosamente."
    else
      render :new
    end		
  end

  def edit
    @direction = Direction.find(params[:id])
  end

  def update
      @direction = Direction.find(params[:id])
    if @direction.update(direction_params)
      redirect_to directions_path, notice: "La Dirección fue modificada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @direction = Direction.find(params[:id])
    @direction.destroy

    redirect_to directions_path, notice: "La Dirección fue eliminada exitosamente."
  end


  private 
    def direction_params
      params.require(:direction).permit(:name)		
    end

end