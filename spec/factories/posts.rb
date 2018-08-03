FactoryBot.define do
  factory :post do
    description { Faker::Lorem.sentence }
     factory :post_with_attachment do
      photo { File.new("#{Rails.root}/spec/factories/wolf.jpg") }
    end
  end
end