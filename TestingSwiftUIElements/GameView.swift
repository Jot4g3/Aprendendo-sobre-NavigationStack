//
//  GameView.swift
//  TestingSwiftUIElements
//
//  Created by iredefbmac_33 on 19/01/25.
//

import SwiftUI

struct GameView: View {
    
    var game: Game = .init(name: "GameModel01", rating: 4)
    
    var body: some View {
        VStack(alignment: .leading){
            Text(game.name)
                .font(.largeTitle)
                .bold()
                .lineLimit(1)
                .padding(20)
            HStack{
                if game.rating != 0{
                    ForEach(1...game.rating, id: \.self){ _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .frame(alignment: .leading)
                    }
                }
                if game.rating < 5{
                    ForEach(1...(5-game.rating), id: \.self){ _ in
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                            .frame(alignment: .leading)
                    }
                }
            }
            .padding(.leading, 20.0)
        }
    }
}

#Preview {
    GameView()
}
