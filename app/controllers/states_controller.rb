class StatesController < ApplicationController

  def index
  	@states = State.all.order("created_at ASC");
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    @state.user = current_user
    if @state.save
      redirect_to states_path, notice: "El Estado fue creado exitosamente."
    else
      render :new
    end		
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
      @state = State.find(params[:id])
    if @state.update(state_params)
      redirect_to states_path, notice: "El Estado fue modificado exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy

    redirect_to states_path, notice: "El Estado fue eliminado exitosamente."
  end


  private 
    def state_params
      params.require(:state).permit(:order, :name, :color)		
    end

end