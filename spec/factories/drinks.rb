FactoryGirl.define do
  factory :drink do 
    name 'Drink'
    description 'A classic'
    instructions 'Whatever'

    trait(:with_orange_peel) do
      after(:create) do |drink| 
        drink.add(FactoryGirl.create(:orange_peel), 'garnish', 1)
      end
    end

    trait(:with_vermouth) do
      after(:create) do |drink| 
        drink.add(FactoryGirl.create(:vermouth), 'oz', 3/4.0) 
      end
    end

    trait(:with_bourbon) do
      after(:create) do |drink| 
        drink.add(FactoryGirl.create(:bourbon), 'oz', 2.5) 
      end
    end

    trait(:with_angostura) do
      after(:create) do |drink| 
        drink.add(FactoryGirl.create(:angostura), 'dash', 1) 
      end
    end

    factory :manhattan, traits: [:with_orange_peel, :with_vermouth, :with_bourbon, :with_angostura] do 
      name 'Manhattan'
      description 'A classy drink'
      instructions 'Mix and garnish with bitters and orange peel.'
    end

    factory :old_fashioned, traits: [:with_bourbon, :with_angostura, :with_orange_peel] do 
      name 'Old Fashioned'
      description 'Yum'
      instructions 'Crush sugar cube with bitters. Add bourbon.'
    end
  end
end