class ProCon < ActiveRecord::Base

  scope :cons, -> { where(cons: true) }
  scope :pros, -> { where(cons: false) }
  
  has_many :smiles
  has_many :frowns
  belongs_to :discussion

  def user_liked?(user)
    smiles.find { |s| s.user == user }
  end

  def user_disliked?(user)
    frowns.find { |s| s.user == user } if user
  end

end