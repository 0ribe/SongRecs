class Song < ApplicationRecord
    belongs_to :user   #追加

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :song_tag_relations, dependent: :destroy
    has_many :tags, through: :song_tag_relations, dependent: :destroy
end
