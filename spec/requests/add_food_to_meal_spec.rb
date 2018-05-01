require 'rails_helper'

describe "POST /api/v1/meals/:meal_id/foods/:id" do
  before(:each) do
    @breakfast = Meal.create!(name: "Breakfast")
    @orange = Food.create!(name: "Orange", calories: 35)
  end

  it "adds a food to a meal" do
    post "/api/v1/meals/#{@breakfast.id}/foods/#{@orange.id}"

    expect(response.status).to eq(201)
    expect(@breakfast.foods.include?("Orange"))
  end

  it "returns 404 if food not found" do
    post "/api/v1/meals/#{@breakfast.id}/foods/444"

    expect(response.status).to eq(404)
  end

  it "returns 404 if meal not found" do
    post "/api/v1/meals/444/foods/#{@orange.id}"

    expect(response.status).to eq(404)
  end
end
