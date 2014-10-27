class ProCon < ActiveRecord::Base

  scope :cons, -> { where(cons: true) }
  scope :pros, -> { where(cons: false) }
  
  has_many :smiles
  belongs_to :discussion

end