require 'rails_helper'

describe "GET /api/v1/foods/:id" do
  it "returns a single food item" do
    banana = Food.create!(name: "Banana", calories: 34)

    expected = "{\"id\":#{banana.id},\"name\":\"Banana\",\"calories\":34}"

    get "/api/v1/foods/#{banana.id}"

    expect(response.body).to eq(expected)
  end
end
