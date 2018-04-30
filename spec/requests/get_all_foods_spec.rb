require 'rails_helper'

describe "GET /api/v1/foods" do
  it "returns a list of all foods" do
    banana = Food.create!(name: "Banana", calories: 34)
    jerky = Food.create!(name: "Beef Jerky", calories: 95)

    expected = "[{\"id\":#{banana.id},\"name\":\"Banana\",\"calories\":34},{\"id\":#{jerky.id},\"name\":\"Beef Jerky\",\"calories\":95}]"

    get "/api/v1/foods"

    expect(response.body).to eq(expected)
  end
end
