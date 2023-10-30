class Category < ApplicationRecord
  extend FriendlyId

  has_many :posts, dependent: :destroy

  friendly_id :slug, use: [:slugged, :finders, :history]
  
  def slug
    "#{id}-#{name.parameterize}"
  end

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
