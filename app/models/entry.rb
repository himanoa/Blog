class Entry < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :body_html, presence: true
  validates :body_md, presence: true
  belongs_to :admin_user
end
