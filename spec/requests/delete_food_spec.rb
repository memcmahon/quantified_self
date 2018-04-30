require 'rails_helper'

describe 'DELETE /api/v1/foods/:id' do
  it 'deletes a food item' do
    banana = Food.create!(name: "Banana", calories: 34)

    delete "/api/v1/foods/#{banana.id}"

    expect(response.status).to eq(204)
  end

  it 'returns 404 if food not found' do
    delete "/api/v1/foods/113"

    expect(response.status).to eq(404)
  end
end
