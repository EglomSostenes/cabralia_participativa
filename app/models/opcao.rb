class Opcao < ApplicationRecord
  belongs_to :enquete
  has_many :choices
  validates :nome, presence: true
  validates :enquete, presence: true

  after_create do
    self.pontos = 0
    self.save
  end
end
