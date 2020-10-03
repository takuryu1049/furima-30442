FactoryBot.define do
  factory :user do
    nickname              { Faker::Games::Pokemon.name }
    first_name            { Gimei.last.kanji }
    last_name             { Gimei.first.kanji }
    first_name_kana       { Gimei.last.katakana }
    last_name_kana        { Gimei.first.katakana }
    birth                 { Faker::Date.birthday(min_age: 5, max_age: 90) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end

# first_nameとlastNameを逆に認識していました。恥ずかしいけど直すと逆に可読性の為に時間かかるので指摘あったら直す。

# 誕生日は、調べたところ、2020/10/03段階では、5歳から登録でき、90歳まで登録できる仕様になっている。現実5歳が購入することは、
# あってはならないと思うので、後々修正を加える。
