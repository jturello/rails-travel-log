FactoryGirl.define do
  factory :user do

  end
  factory :country do
    name 'Mordor'
    blurb 'Sights to see - the Eye of Sauron!'
    description 'Billowing clouds of choking soot!'
  end

  factory :destination do
    name 'Barad Dur'
    blurb 'Beautiful city of Sauron with postcard perfect views of Mount Doom'
    description "At the foothills of Ered Lithiu. Take a day trip to Mount Doom!"
    country
  end
end
