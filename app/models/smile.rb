class Smile < ActiveRecord::Base

  belongs_to :pro_con
  belongs_to :user

  validates :pro_con, uniqueness: { scope: :user }

end
