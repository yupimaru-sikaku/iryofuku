class ServiceType < ActiveHash::Base

  include ActiveHash::Associations
  has_many :sagaserus

  self.data = [
    { id: 1, name: 'サービス1' },
    { id: 2, name: 'サービス2' },
    { id: 3, name: 'サービス3' },
    { id: 4, name: 'サービス4' },
    { id: 5, name: 'サービス5' },
  ]
end
