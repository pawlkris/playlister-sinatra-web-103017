class SongGenre < ActiveRecord::Base
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods
  belongs_to :song
  belongs_to :genre
end
