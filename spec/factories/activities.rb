# == Schema Information
#
# Table name: activities
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  note       :text
#  paid       :boolean          default(FALSE)
#  value      :decimal(10, 2)   default(0.0)
#  done_at    :datetime
#  type_a     :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_activities_on_user_id  (user_id)
#
FactoryBot.define do
  factory :activity do
    title { Faker::Device.model_name }
    note { 'MyText' }
    paid { true }
    value { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    done_at { Faker::Date.between(from: 3.days.ago, to: Time.zone.today) }
    type_a { 'expense' }
    user
  end
end
