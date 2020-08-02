class Choice < ApplicationRecord
  belongs_to :opcao
  belongs_to :user
  validates :opcao, presence: true
end
