# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
  validates :title, :description, :user_id, presence: true
  validates :title, :user_id, uniqueness: true

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User

  has_many :posts,
    foreign_key: :sub_id,
    class_name: :Post
end
