class RolesController < ApplicationController

  def index
  	@roles = Role.all.order("created_at DESC");
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.user = current_user
    if @role.save
      redirect_to roles_path, notice: "El Rol fue creado exitosamente."
    else
      render :new
    end		
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
      @role = Role.find(params[:id])
    if @role.update(role_params)
      redirect_to roles_path, notice: "El Rol fue modificado exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    redirect_to roles_path, notice: "El Rol fue eliminado exitosamente."
  end


  private 
    def role_params
      params.require(:role).permit(:name)		
    end

end
