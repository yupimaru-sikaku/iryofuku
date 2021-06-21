# 障害の種類
class DisabilityType < ActiveHash::Base
  include ActiveHash::Associations
  has_many :iryos

  self.data = [
    { id: 1, name: '障がい種類1' }, { id: 2, name: '障がい種類2' },
    { id: 3, name: '障がい種類3' }, { id: 4, name: '障がい種類4' },
  ]  
end