# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  image_url :string           not null
#  title     :string           not null
#  artist_id :integer          not null
#
# Indexes
#
#  index_artworks_on_artist_id_and_title  (artist_id,title) UNIQUE
#
class Artwork < ApplicationRecord
  validates :artist_id, presence: true, uniqueness: { scope: :title }
  validates :image_url, presence: true
  validates :title, presence: true

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShares

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
