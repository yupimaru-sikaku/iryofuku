# 障害区分
class Classification < ActiveHash::Base
  include ActiveHash::Associations
  has_many :sagaserus

  self.data = [
    { id: 1, name: '区分1'},
    { id: 2, name: '区分2'},
    { id: 3, name: '区分3'},
    { id: 4, name: '区分4'},
    { id: 5, name: '区分5'},
  ]

end