class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :project
    belongs_to :discussion

    validates :body, :user_id, :discussion_id, :project_id, presence: true
  end