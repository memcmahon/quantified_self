require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe "Relationships" do
    it { should have_many :foods }
    it { should have_many :meal_foods }
  end
end
