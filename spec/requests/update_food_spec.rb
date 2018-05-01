require 'rails_helper'

describe "PATCH /api/v1/foods/:id" do
  before(:each) do
    @cookies = Food.create!(name: "Mint Choco Cookies", calories: 150)
  end

  it "updates the food specified" do
    patch "/api/v1/foods/#{@cookies.id}", params: {"food": { "name": "Thin Mints", "calories": "150"}}

    expect(response.status).to eq(200)
    expect(Food.find(@cookies.id).name).to eq("Thin Mints")
  end

  it "returns 400 if name is not included" do
    patch "/api/v1/foods/#{@cookies.id}", params: {"food": {"calories": "150"}}

    expect(response.status).to eq(400)
  end

  it "returns 400 if calories is not included" do
    patch "/api/v1/foods/#{@cookies.id}", params: {"food": { "name": "Thin Mints"}}

    expect(response.status).to eq(400)
  end
end
