class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    render json: Food.find(params[:id])
  end

  def destroy
    Food.destroy(params[:id])
    rescue ActiveRecord::RecordNotFound
      render status: 404, json: { message: "Food Not Found" }
  end
end
