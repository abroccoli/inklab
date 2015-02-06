class Story < ActiveRecord::Base
  belongs_to :user
  has_many :lines

  validates :title, presence: true
end
