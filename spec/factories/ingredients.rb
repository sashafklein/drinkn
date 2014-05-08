FactoryGirl.define do
  factory :ingredient do 
    name 'A thing'
    description "It's delicious"

    factory :vermouth do
      name "Vermouth"
      description 'An italian herbal fortified wine'
    end

    factory :bourbon do
      name 'Bourbon'
      description 'Whiskey distilled from corn in America'
    end

    factory :angostura do
      name 'Angostura Bitters'
      description 'A potent mix of spices and high-proof alcohol'
    end

    factory :orange_peel do
      name 'Orange Peel'
      description 'The rind of an orange, usually bitter.'
    end

    factory :cherry do 
      name 'Maraschino Cherry'
      description 'A nasty nasty thing'
    end
  end
end