//
//  PropriedadeEditarView.swift
//  Stickers
//
//  Created by André Toti on 14/04/23.
//

import SwiftUI

struct PropriedadeEditarView: View {
    
    @Binding var valor: String
    @Binding var valorInt: Int
    @Binding var valorDec: Double
    var tipo: TipoPropriedade = .texto
        
    var body: some View {
        VStack {
            if tipo == .numeroInteiro {
                Stepper("Valor atual: \(valorInt)", value: $valorInt)
            }
            if tipo == .numeroDecimal {
                Text("Valor atual: \(valorDec * 100, specifier: "%.0f")%")
                Slider(value: $valorDec)
            }
            if tipo == .texto {
                TextEditor(text: $valor)
            }
            Spacer()
        }
        .padding()
    }
}

struct PropriedadeEditarView_Previews: PreviewProvider {
    static var previews: some View {
        PropriedadeEditarView(valor: .constant(""), valorInt: .constant(0), valorDec: .constant(1.0), tipo: .numeroDecimal)
    }
}
