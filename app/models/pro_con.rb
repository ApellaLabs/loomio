class ProCon < ActiveRecord::Base

  has_many :smiles
  belongs_to :discussion

end
