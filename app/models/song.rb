class Song < ActiveRecord::Base
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
