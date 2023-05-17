//
//  PropriedadesView.swift
//  Stickers
//
//  Created by André Toti on 12/04/23.
//

import SwiftUI

enum TipoPropriedade {
    case numeroInteiro
    case numeroDecimal
    case texto
}

struct PropriedadesView: View {
    
    var imagem: String = "lifepreserver"
    var nome: String = "Vidas: "
    @Binding var valor: String
    @Binding var valorInt: Int
    @Binding var valorDec: Double
    var cor: Color = .green
    var tipo: TipoPropriedade = .numeroDecimal
    
    @State var apresentado = false
    
    var body: some View {
        Button {
            apresentado = true
        } label: {
            HStack {
                Image(systemName: imagem)
                    .foregroundColor(cor)
                    .frame(width: 30.0)
                .font(.system(size: 25))
                Text(nome)
                
                if tipo == .texto {
                    Text(valor)
                        .padding(.trailing)
                }
                if tipo == .numeroInteiro {
                    Text("\(valorInt)")
                }
                if tipo == .numeroDecimal {
                    Text("\(valorDec * 100, specifier: "%.0f")%")
                }
            }
        }
        .sheet(isPresented: $apresentado) {
            PropriedadeEditarView(valor: $valor, valorInt: $valorInt, valorDec: $valorDec, tipo: tipo)
        }
    }
}

struct PropriedadesView_Previews: PreviewProvider {
    static var previews: some View {
        PropriedadesView(valor: .constant(""), valorInt: .constant(0), valorDec: .constant(1.0))
    }
}
