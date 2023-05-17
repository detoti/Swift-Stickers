//
//  FiguraDetalheView.swift
//  Stickers
//
//  Created by André Toti on 14/04/23.
//

import SwiftUI

struct FiguraDetalheView: View {
    
    @ObservedObject var figura: Figura
    @EnvironmentObject var minhaColecao: MinhaColecao
    
        var body: some View {
            VStack (alignment: .leading){
                Text(figura.nome)
                    .font(.title)
                    .bold()
                    .padding()
                
                HStack {
                    Text("Frase: ")
                        .bold()
                        .padding(.leading)
                    Text("\"\(figura.frase)\"")
                        .font(.title3)
                }
                
                HStack {
                    Image(figura.imagem)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                    
                    VStack (alignment: .leading){
                        
                        PropriedadesView(valor: .constant(""), valorInt: $figura.vidas, valorDec: .constant(0), tipo: .numeroInteiro)
                        PropriedadesView(imagem: "bolt", nome: "Potência", valor: .constant(""), valorInt: .constant(0), valorDec: $figura.potencia, cor: .yellow, tipo: .numeroDecimal)
                        
                    }
                    
                }
                .padding(30)
                HStack {
                    Spacer()
                    Text(figura.descricao)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                    
                Spacer()
                
                HStack {
                    Spacer()
                Button {
                    minhaColecao.figuras.append(figura)
                    minhaColecao.salvar()
                } label: {
                    
                    if minhaColecao.figuras.count == 0 {
                        
                        Text("Adicione a sua coleção")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(.blue)
                            .cornerRadius(25)
                        
                    } else {
                        Text("Na sua coleção: \(minhaColecao.figuras.count)")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(.green)
                            .cornerRadius(25)
                    }
                    
                }
                    Spacer()
                }
                .padding()
                    
            }
            .padding()
        
        }
    }

struct FiguraDetalheView_Previews: PreviewProvider {
    static var previews: some View {
        FiguraDetalheView(figura: figuras[0])
    }
}
