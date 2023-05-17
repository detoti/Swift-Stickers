//
//  FigurasListaView.swift
//  Stickers
//
//  Created by André Toti on 24/04/23.
//

import SwiftUI

struct FigurasListaView: View {
    
    var figura: Figura
    var cor: Color = .gray
    
    var body: some View {
        HStack {
            Image(figura.imagem)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .background(cor)
                .containerShape(Circle())
            Text(figura.nome)
        }
    }
}

struct FigurasListaView_Previews: PreviewProvider {
    static var previews: some View {
        FigurasListaView(figura: figuras[0])
    }
}
