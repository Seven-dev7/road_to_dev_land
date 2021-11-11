FactoryBot.define do
  factory :codewars_info do
    username { "MyString" }
    name { "MyString" }
    clan { "MyString" }
    honor { "MyString" }
    leaderboardPosition { "MyString" }
    totalAuthored { "MyString" }
    totalCompleted { "MyString" }
    user { nil }
  end
end
