class User < ActiveRecord::Base
  has_many :stories
  has_many :lines
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def current_email
    current_user.email
  end
end

