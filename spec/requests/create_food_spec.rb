require 'rails_helper'

describe 'POST /api/v1/foods' do
  it 'creates a new food' do
    post '/api/v1/foods', params: { "food": { "name": "Banana", "calories": 35} }

    expect(response.status).to eq(200)
    expect(Food.count).to eq(1)
    expect(Food.last.name).to eq("Banana")
    expect(Food.last.calories).to eq(35)
  end

  it 'will not create without a name' do
    post '/api/v1/foods', params: { "food": { "calories": 35}}

    expect(response.status).to eq(400)
    expect(Food.count).to eq(0)
  end

  it 'will not create without calories' do
    post '/api/v1/foods', params: { "food": { "name": "banana"}}

    expect(response.status).to eq(400)
    expect(Food.count).to eq(0)
  end
end
