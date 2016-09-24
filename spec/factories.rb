FactoryGirl.define do
  # factory :user do

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

  factory :user do
    username 'John Doe'
    email 'johndoe@bananas.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :destination_post, class: :post do |post|
    post.content 'This is a destination post!'
    user
    commentable do |p|
      p.association(:destination)
    end
  end

  factory :country_post, class: :post do |post|
    post.content 'This is a country post!'
    user
    commentable do |p|
      p.association(:country)
    end
  end

end
