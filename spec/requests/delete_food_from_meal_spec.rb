require 'rails_helper'

describe "DELETE /api/v1/meals/:id/foods/:id" do
  before(:each) do
    @breakfast = Meal.create!(name: "Breakfast")
    @orange = @breakfast.foods.create!(name: "Orange", calories: 35)
  end

  it "removes food from a specific meal" do

    delete "/api/v1/meals/#{@breakfast.id}/foods/#{@orange.id}"

    expect(@breakfast.foods.empty?)
    expect(response.body).to eq("{\"message\":\"Successfully removed Orange from Breakfast\"}")
  end

  it "does not remove if meal doesn't exists" do
    delete "/api/v1/meals/311/foods/#{@orange.id}"

    expect(response.status).to eq(404)
  end

  it "does not remove if food doesn't exists" do
    delete "/api/v1/meals/#{@breakfast.id}/foods/311"

    expect(response.status).to eq(404)
  end
end
