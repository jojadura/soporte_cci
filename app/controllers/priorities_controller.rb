class PrioritiesController < ApplicationController
  
  def index
  	@priorities = Priority.all.order("created_at ASC");
  end

  def new
    @priority = Priority.new
  end

  def create
    @priority = Priority.new(priority_params)
    @priority.user = current_user
    if @priority.save
      redirect_to priorities_path, notice: "La Prioridad fue creada exitosamente."
    else
      render :new
    end		
  end

  def edit
    @priority = Priority.find(params[:id])
  end

  def update
      @priority = Priority.find(params[:id])
    if @priority.update(priority_params)
      redirect_to priorities_path, notice: "La Prioridad fue modificada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @priority = Priority.find(params[:id])
    @priority.destroy

    redirect_to priorities_path, notice: "La Prioridad fue eliminada exitosamente."
  end


  private 
    def priority_params
      params.require(:priority).permit(:name)		
    end

end