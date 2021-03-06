require 'rails_helper'

RSpec.describe Food, type: :model do
  describe "Relationships" do
    it { should have_many :meals }
    it { should have_many :meal_foods }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end
end
