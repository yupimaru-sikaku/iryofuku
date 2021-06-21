# 性別
class Sex < ActiveHash::Base
  include ActiveHash::Associations
  has_many :iryos

  self.data = [
    { id: 1, name: '男性' }, { id: 2, name: '女性' },
  ]  
end