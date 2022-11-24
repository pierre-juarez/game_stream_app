//
//  GamesView.swift
//  GameStreamAppiOs
//
//  Created by Pierre Juarez U. on 23/11/22.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantalla Juegos")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(
          perform: {
            print("Primer elemento del JSON...")
            print("Título del primer videojuego del JSON...")
          }
        )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
