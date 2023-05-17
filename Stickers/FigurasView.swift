//
//  FigurasView.swift
//  Stickers
//
//  Created by André Toti on 14/04/23.
//

import SwiftUI

struct FigurasView: View {
    
    @State var apresentacao = false
    
    var body: some View {
        
        List(figuras) { figura in
            NavigationLink(destination: FiguraDetalheView(figura: figura)) {
                FigurasListaView(figura: figura)
                }
            }
        .navigationTitle("Figuras")
    }
}

struct FigurasView_Previews: PreviewProvider {
    static var previews: some View {
        FigurasView()
    }
}
