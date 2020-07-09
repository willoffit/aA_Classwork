# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true 

  has_many :artworks, dependent: :destroy,
    foreign_key: :artist_id,
    class_name: :Artwork
    

  has_many :artwork_shares, dependent: :destroy,
    foreign_key: :viewer_id,
    class_name: :ArtworkShares
    

  has_many :shared_artworks, dependent: :destroy,
    through: :artwork_shares,
    source: :artwork
end
