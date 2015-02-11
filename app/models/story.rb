require 'byebug'
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
    # binding.byebug
    if lines.last.valid?
      lines.last.content.capitalize
    else
      lines[-2].content.capitalize
    end
  end
end
