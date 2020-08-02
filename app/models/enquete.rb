class Enquete < ApplicationRecord
    has_many :opcaos
    validates :titulo, presence: true
    validates :descricao, presence: true

    accepts_nested_attributes_for :opcaos, allow_destroy: true

    def contabiliza_votos
        opcoes = self.opcaos
        votos = []
        opcaos.each do |op|
            votos_opcao = Choice.where(opcao: op)
            votos << votos_opcao.count
            op.pontos = votos_opcao.count
            op.save
        end
        return votos
    end

    def vencedor
        votos = self.contabiliza_votos
        maior = votos[0]
        posicao = 0
        vencedor = 0
        votos.each do |v|
            if v > maior
                maior = v
                vencedor = posicao
            end
            posicao = posicao + 1
        end
        opcoes = self.opcaos
        opcoes[vencedor].pontos = maior
        opcoes[vencedor].save
        return opcoes[vencedor]
    end 
end
