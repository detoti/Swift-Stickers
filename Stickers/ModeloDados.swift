//
//  ModeloDados.swift
//  Stickers
//
//  Created by André Toti on 14/04/23.
//

import Foundation

class Figura: Identifiable, ObservableObject, Codable {
    var id = UUID()
    var nome: String
    var imagem: String
    var frase: String
    var descricao: String
    @Published var vidas: Int
    @Published var potencia: Double
    
    init(nome: String, imagem: String, frase: String, descricao: String, vidas: Int, potencia: Double) {
        self.nome = nome
        self.imagem = imagem
        self.frase = frase
        self.descricao = descricao
        self.vidas = vidas
        self.potencia = potencia
    }
    
    enum CodingKeys: CodingKey {
        case nome
        case imagem
        case frase
        case descricao
        case vidas
        case potencia
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.nome, forKey: .nome)
        try container.encode(self.imagem, forKey: .imagem)
        try container.encode(self.frase, forKey: .frase)
        try container.encode(self.descricao, forKey: .descricao)
        try container.encode(self.vidas, forKey: .vidas)
        try container.encode(self.potencia, forKey: .potencia)
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.nome = try values.decode(String.self, forKey: .nome)
        self.imagem = try values.decode(String.self, forKey: .imagem)
        self.frase = try values.decode(String.self, forKey: .frase)
        self.descricao = try values.decode(String.self, forKey: .descricao)
        self.vidas = try values.decode(Int.self, forKey: .vidas)
        self.potencia = try values.decode(Double.self, forKey: .potencia)
    }
    
}

class MinhaColecao: ObservableObject {
    @Published var figuras: [Figura] = []
    
    init() {
        if let figurasCodificadas = UserDefaults.standard.object(forKey: "figuras") as? Data {
            let decoder = JSONDecoder()
            if let figurasDescodificadas = try? decoder.decode([Figura].self, from: figurasCodificadas) {
                self.figuras = figurasDescodificadas
            }
        }
    }
    
    func salvar() {
        let encoder = JSONEncoder()
        if let figurasCodificadas = try? encoder.encode(self.figuras) {
            UserDefaults.standard.set(figurasCodificadas, forKey: "figuras")
        }
    }
}

var figuras = [
    Figura(
        nome:"Mingle",
        imagem:"figura_01",
        frase:"Problema em dobro",
        descricao:"O Mingle se destaca por fazer o dobro do trabalho na metade do tempo, com extrema precisão. Essas habilidades são úteis para ela em sua função de Analista de Dados Sênior para uma empresa internacional de computação em nuvem. Ela também tem uma propensão para dança de salão, dança de linha e praticamente qualquer tipo de atividade que a deixe dançar ao som da música.",
        vidas:2,
        potencia:0.42
    ),
    Figura(
        nome:"Yodel",
        imagem:"figura_02",
        frase:"Iodelaii Hii Huu!",
        descricao:"Yodel cresceu em uma família de cantores e faladores e nunca conseguia falar uma palavra. Então, seu vasto talento para o yodeling surgiu. Agora ele se apresenta para fãs adoradores em todo o mundo, e sempre tem a voz mais alta na mesa de jantar. Aliás, ele também é um grande defensor da neutralidade da rede e passa incontáveis horas moderando um fórum na internet dedicado exclusivamente a esse assunto.",
        vidas:4,
        potencia:0.19
    ),
    Figura(
        nome:"Squido",
        imagem:"figura_03",
        frase:"Um olho para o design",
        descricao:"Squido tem as mãos, ou melhor, tentáculos, em tudo. Em primeiro lugar, ele é um web designer com foco na estética visual, mas também gosta de design de UX e garante que o que ele cria seja traduzido de maneira ideal para o usuário final. Nas horas de folga, ele é um ávido fotógrafo da natureza e jogador de boliche.",
        vidas:3,
        potencia:0.91
)]
