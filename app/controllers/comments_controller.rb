class CommentsController < ApplicationController

  def index
  	@comments = Comment.all.order("created_at DESC");
  end

  def new
    @comment = Comment.new
  end

  def create
    @category = Comment.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to categories_path, notice: "La Categoría fue creada exitosamente."
    else
      render :new
    end		
  end

  def comment_params
     params.require(:comment).permit(:note, :read, :support_id, :user_id)
   end

end
