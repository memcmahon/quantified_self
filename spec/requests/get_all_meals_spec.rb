require 'rails_helper'

describe "GET /api/v1/meals" do
  it "returns a list of all meals" do
    breakfast = Meal.create!(name: "Breakfast")
    lunch = Meal.create!(name: "Lunch")

    expected = "[{\"id\":#{breakfast.id},\"name\":\"Breakfast,\"Foods\":[]},{\"id\":#{lunch.id},\"name\":\"Lunch,\"Foods\":[]}]"

    get "/api/v1/meals"

    expect(response.body).to eq(expected)
  end
end
