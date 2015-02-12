class Line < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :content, presence: true
  validates_format_of :content, with: /[.!?]\z/, on: :create, message: 'Punctuate that line yo!'

  auto_strip_attributes :content
end
