FactoryGirl.define do
  factory :drink do 
    name 'Drink'
    description 'A classic'
    instructions 'Whatever'
  end

  factory :manhattan do 
    name 'Manhattan'
    description 'A classy drink'
    instructions 'Mix and garnish with bitters and orange peel.'
    after(:build) do |manhattan|
      manhattan.add(FactoryGirl.create(:vermouth), 'oz', 3/4.0)
      manhattan.add(FactoryGirl.create(:bourbon), 'oz', 2.5)
      manhattan.add(FactoryGirl.create(:angostura), 'dash', 1)
      manhattan.add(FactoryGirl.create(:orange_peel), 'garnish', 1)
    end
  end
end