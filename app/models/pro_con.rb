class ProCon < ActiveRecord::Base

  scope :cons, -> { where(cons: true) }
  scope :pros, -> { where(cons: false) }
  
  has_many :smiles
  belongs_to :discussion

  def smiles_count
    smiles ? smiles.count : 0
  end

end