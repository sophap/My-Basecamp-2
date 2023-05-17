class Project < ApplicationRecord
    belongs_to :user
    has_many :discussions, dependent: :destroy
    has_many :comments, through: :discussions
    has_many :uploads, dependent: :destroy
    validates :name, :description, presence: true
end