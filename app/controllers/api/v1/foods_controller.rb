class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  end

  def create
    food = Food.new(name: params["food"]["name"], calories: params["food"]["calories"])
    if food.save
      render json: food
    else
      render status: 400
    end
  end

  def update
    food = Food.find(params[:id])
    if food.update(name: params["food"]["name"], calories: params["food"]["calories"])
      render json: food
    else
      render status: 400
    end
  end

  def destroy
    Food.destroy(params[:id])
    rescue ActiveRecord::RecordNotFound
      render status: 404, json: { message: "Food Not Found" }
  end
end
