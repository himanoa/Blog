class Entry < ApplicationRecord
  self.per_page = 5
  validates :title, presence: true, length: { maximum: 50 }
  validates :body_html, presence: true
  validates :body_md, presence: true
  belongs_to :admin_user
  by_star_field :created_at
  acts_as_taggable
end
