class SupportsController < ApplicationController
  before_action :user_usuario?
  before_action :set_info, only: [:new, :create]
  before_action :set_support, only: [:show, :close,:update]

  def index
    @supports = current_user.supports.all_order params[:search], params[:page], 10
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    @support.user_id = current_user.id
    if @support.save
      redirect_to supports_path, notice: "El Soporte fue creado exitosamente."
    else
     render 'new'
    end   
  end

  def show
    @comment= Comment.new({user_id:current_user.id,support_id:@support.id})
    if request.post?
      @comment.assign_attributes(comment_params)
     
      if @comment.save
        redirect_to support_path(@support), method: :show, notice: 'State was successfully created.'
      else
        render :show
      end
    end
  end

  #def close
   # @support.close
    #redirect_to supports_path, notice: "El soporte fue cerrado exitosamente."
  #end

  def close
        respond_to do |format|
          format.html {render :close}
          format.js
        end
    if request.post?
      @support.close  support_close_params[:poll].to_i
    end
  end  

  def subcategories
    @sub_categories = SubCategory.where(category_id = params[:category_id])
  end

  def set_info
     @categorias = Category.all.order(:title)
     @sub_categorias = SubCategory.all.order(:name)
     @prioridades=Priority.all
  end
  

  private 

    def support_close_params
      params.require(:support).permit(:poll)
    end

    def support_params
      params.require(:support).permit(:title, :sub_categories_id, :description, :priority_id, :screen)    
    end

    def comment_params
      params.require(:comment).permit(:note)    
    end 

    def set_support
      @support = Support.find(params[:id])
    end

end
