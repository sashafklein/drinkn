class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :visits

  def name
    "#{first_name} #{last_name}"
  end

  def admin?
    role == 'admin'
  end
end
