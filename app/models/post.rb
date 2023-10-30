class Post < ApplicationRecord
  extend FriendlyId

  validates :title, presence: true, length: {minimum:5, maximum:50}
  validates :body, presence: true

  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :notifications, through: :user

  has_one_attached :image
  has_many_attached :pictures

  has_noticed_notifications model_name: "Notification"
  has_rich_text :body
  has_one :content, class_name: "ActionText::RichText", as: :record, dependent: :destroy

  friendly_id :slug, use: [:slugged, :finders, :history]
  
  def slug
    "#{id}-#{title.parameterize}"
  end

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
