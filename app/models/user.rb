class User < ActiveRecord::Base
  has_many :stories
  has_many :lines
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def total_stories
    stories.count
  end

  def total_lines
    lines.count
  end
end

