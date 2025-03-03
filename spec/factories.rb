FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
  end

  factory :borrower do
    name { Faker::Name.name }
  end

  factory :lending do
    book
    borrower
    borrowed_at { Time.current }
    returned_at { nil }
  end
end