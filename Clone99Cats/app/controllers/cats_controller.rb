class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    render json: params
  end

  def edit
    @cat = Cat.find(params[:id])
  end 

  def update
    render json: params
  end
end
