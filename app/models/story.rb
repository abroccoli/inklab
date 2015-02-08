class Story < ActiveRecord::Base
  belongs_to :user
  has_many :lines

  validates :title, presence: true

  def compile
    lines.map{|line| line.content.capitalize}.join(" ")
  end

  def last_line
    lines.last.content.capitalize
  end

end
