class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comments, dependent: :destroy
  validates :user_id, :body, presence: true
end
