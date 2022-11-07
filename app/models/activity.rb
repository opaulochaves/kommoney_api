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
class Activity < ApplicationRecord
  belongs_to :user

  def self.supported_types
    %w[income expense]
  end

  validates :title, presence: true
  validates :type_a, inclusion: { in: supported_types }
end
