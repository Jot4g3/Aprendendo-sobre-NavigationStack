//
//  ContentView.swift
//  TestingSwiftUIElements
//
//  Created by iredefbmac_33 on 14/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    var tasks : [Task] = [Task(name: "TaskExample01", isDone: false), Task(name: "TaskExample02", isDone: false)]
    
    var platforms : [Platform] = [.init(name: "Xbox", imageName: "xbox.logo", color: .green), .init(name: "Playstation", imageName: "playstation.logo", color: .indigo), .init(name: "PC", imageName: "pc", color: .red), .init(name: "Mobile", imageName: "iphone", color: .mint)]
    
    //var games : [Game] = [.init(name: "Minecraft", rating: 4), .init(name: "Fortnite", rating: 3), .init(name: "God Of War", rating: 3), .init(name: "Grand Theft Auto V", rating: 5)]
    
    @Query var games : [Game]
    
    @State private var path : [Game] = []
    
    var body: some View {
        Text("Studying Navigation Stack")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
            .lineLimit(1)
        VStack{
            // NavigationStack é basicamente um array de dados, que os traduz para Views.
            NavigationStack{
                List{
                    Section("Platforms"){
                        ForEach(platforms, id: \.name) { platform in
                            // O link para a plataforma é PlatformView, por isso está dentro do NavigationLink
                            NavigationLink(value: platform){
                                PlatformView(platform: platform)
                            }
                        }
                    }
                    Section("Games"){
                        NavigationLink(destination: AddGameView()){
                            Text("Add New Game")
                                .font(.largeTitle)
                                .bold()
                                .padding()
                                .cornerRadius(8)
                        }
                        ForEach(games, id:\.name) { game in
                            // O link para o jogo é GameView, por isso está dentro do NavigationLink
                            NavigationLink(value: game){
                                GameView(game: game)
                            }
                        }
                        Button{
                            path = games
                        } label: {
                            Text("See all")
                                .font(.title)
                        }
                    }
                }
                // Usamos esse modificador .navigationTitle para definir o título da NavigationStack
                .navigationTitle("Gaming")
                // O destino se for um objeto do tipo Platform, é o que está definido após as chaves. Todas as plataformas terão um destino (platform in)
                .navigationDestination(for: Platform.self){ platform in
                    ZStack{
                        platform.colorComponent.color.ignoresSafeArea()
                        Label(platform.name, systemImage: platform.imageName)
                            .font(.largeTitle).bold()
                    }
                    
                }
                // O destino se for um objeto do tipo Game, é o que está definido após as chaves. Todas os Games terão um destino (game in)
                .navigationDestination(for: Game.self) { game in
                    GameView(game: game)
                }
                // Observação: Não usei o PlatformView para definir o destino do link da plataforma pois PlatformView foi feito apenas com o objetivo de ser utilizado na NavigationStack.
            }
        }
    }
}



#Preview {
    ContentView()
}
