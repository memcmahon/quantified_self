MealFood.destroy_all
Food.destroy_all
Meal.destroy_all

Meal.create!([{name: "Breakfast"},
              {name: "Lunch"},
              {name: "Snacks"},
              {name: "Dinner"}])

Food.create!([{name: "Banana", calories: 34},
              {name: "Orange", calories: 34},
              {name: "French Silk Pie", calories: 340},
              {name: "Deep Dish Pizza", calories: 890},
              {name: "Spinach Salad w/ Dressing", calories: 240},
              {name: "Roasted Cauliflower", calories: 80},
              {name: "Chicken Breast", calories: 210},
              {name: "Dark Chocolate", calories: 150},
              {name: "Beef Jerky", calories: 95}])
