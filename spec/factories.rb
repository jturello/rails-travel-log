FactoryGirl.define do
  factory :country do
    name 'Modor'
    blurb 'Sights to see - the Eye of Sauron!'
    description 'Billowing clouds of choking soot!'
  end

  factory :destination do
    name 'Barad Dur'
    blurb 'Beautiful city of Sauron with postcard perfect views of Mount Doom'
    description "At the foothills of Ered Lithiu and just a 2 day's march to Mount Doom!"
    country
  end
end
