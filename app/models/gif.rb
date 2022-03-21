class Gif < ApplicationRecord
  has_one_attached :file
  acts_as_taggable_on :tags

  belongs_to :user

  validates :file, attached: true,
                   size: { less_than: 1.megabytes , message: 'is too large' }


  scope :recent, -> { order(created_at: :desc) }
end
