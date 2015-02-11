class Story < ActiveRecord::Base
  belongs_to :user
  has_many :lines
  accepts_nested_attributes_for :lines

  validates :title, presence: true
  validates :lines, presence: true

  def compile
    lines.map{|line| line.content.capitalize}.join(' ')
  end

  def last_line
    lines.last.content.capitalize
  end
end
