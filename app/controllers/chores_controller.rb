class ChoresController < ApplicationController
  before_action :find_chore, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:category].blank?
      @chores = Chore.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @chores = Chore.where(category_id: @category_id).order("created_at DESC")
    end
  end
  
  def show
  end
  
  def new
    @chore = Chore.new
  end
  
  def create
    @chore = Chore.new(chores_params)
    
    if @chore.save
      redirect_to @chore
    else
      render "New"
    end
  end
  
  def edit
  end
  
  def update
  if @chore.update(chores_params)
    redirect_to @chore
  else
    render "Edit"
    end
  end
  
  def destroy
    @chore.destroy
    redirect_to root_path
  end
  
  private
  
  def chores_params
    params.require(:chore).permit(:title, :description, :month_id, :day, :category_id, :status)
  end
  
  def find_chore
    @chore = Chore.find(params[:id])
  end
end