require 'rails_helper'

describe "GET /api/v1/meals/:id/foods" do
  it "returns a single meal" do
    breakfast = Meal.create!(name: "Breakfast")

    expected = "{\"id\":#{breakfast.id},\"name\":\"Breakfast\",\"foods\":[]}"

    get "/api/v1/meals/#{breakfast.id}/foods"

    expect(response.body).to eq(expected)
  end
end
