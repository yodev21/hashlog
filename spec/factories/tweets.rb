FactoryBot.define do
  factory :tweet do
    sequence(:oembed, 'HTML 1')
    tweeted_at { Time.now }
    tweet_id { rand(10 ** 19).to_s }
    registered_tag
  end

  trait :tweeted_yesterday do
    tweeted_at { Time.now.ago(1.day) }
  end

  trait :tweeted_7days_ago do
    tweeted_at { Time.now.ago(7.day) }
  end

  trait :tweeted_every_day do
    sequence(:tweeted_at) { |n| Time.current.ago(n.day) + 1.day }
  end
end
