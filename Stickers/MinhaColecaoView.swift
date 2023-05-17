//
//  MinhaColecaoView.swift
//  Stickers
//
//  Created by André Toti on 24/04/23.
//

import SwiftUI

struct MinhaColecaoView: View {
    @EnvironmentObject var minhaColecao: MinhaColecao
    var body: some View {
        if minhaColecao.figuras.count == 0 {
            Text("Você não tem figuras na sua coleção")
        } else {
            List(minhaColecao.figuras) { figura in
                NavigationLink {
                    FiguraDetalheView(figura: figura)
                } label: {
                    FigurasListaView(figura: figura, cor: .green)
                }
            }
                .navigationTitle("Minha Coleção")
            }
        }
    }

struct MinhaColecaoView_Previews: PreviewProvider {
    static var previews: some View {
        MinhaColecaoView()
    }
}
