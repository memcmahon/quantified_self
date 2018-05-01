class Api::V1::Meals::FoodsController < ApplicationController
  before_action :set_food, :set_meal

  def create
    @meal.foods << @food
    render status: 201
  end

  def destroy
    @meal.foods.destroy(params[:id])
    render json: {message: "Successfully removed #{Food.find(params[:id]).name} from #{@meal.name}"}
  end

  private
    def set_meal
      @meal = Meal.find(params[:meal_id])
      rescue ActiveRecord::RecordNotFound
        not_found
    end

    def set_food
      @food = Food.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        not_found
    end

    def not_found
      render status: 404
    end
end
