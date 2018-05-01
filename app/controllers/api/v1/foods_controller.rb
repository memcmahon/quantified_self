class Api::V1::FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update]

  def index
    render json: Food.all
  end

  def show
    render json: @food
  end

  def create
    food = Food.new(food_attributes)
    if food.save
      render json: food
    else
      render status: 400
    end
  end

  def update
    if @food.update(food_attributes)
      render json: @food
    else
      render status: 400
    end
  end

  def destroy
    Food.destroy(params[:id])
    rescue ActiveRecord::RecordNotFound
      render status: 404, json: { message: "Food Not Found" }
  end

  private
    def food_attributes
      {name: params["food"]["name"], calories: params["food"]["calories"]}
    end

    def set_food
      @food = Food.find(params[:id])
    end
end
