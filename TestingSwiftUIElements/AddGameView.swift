//
//  AddGameView.swift
//  TestingSwiftUIElements
//
//  Created by iredefbmac_33 on 19/01/25.
//

import SwiftUI

struct AddGameView: View {
    
    enum FocusedField {
        case str, int
    }
    
    @FocusState private var focusedField: FocusedField?
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext
    
    @State var gameName: String = ""
    @State var gameRating: String = ""
    
    @State var alertText: String = ""
    
    var body: some View {
        List{
            VStack{
                TextField("Game Name", text: $gameName)
                    .focused($focusedField, equals: .str)
                TextField("Game Rating", text: $gameRating)
                    .focused($focusedField, equals: .int)
                    .keyboardType(.numberPad)
                Text("Ps: Put just values in range 1-5 in Game Rating, please!")
                    .font(.caption)
                    .foregroundColor(.green)
                Text(alertText)
                    .font(.caption)
                    .foregroundColor(.red)
                
                Button(action: {
                    if !gameName.trimmingCharacters(in: .whitespaces).isEmpty {
                        if !gameRating.trimmingCharacters(in: .whitespaces).isEmpty {
                            if let rating = Int(gameRating), (1...5).contains(rating) {
                                let game = Game(name: gameName, rating: rating)
                                modelContext.insert(game)
                                
                                gameName = ""
                                gameRating = ""
                                
                                presentationMode.wrappedValue.dismiss() 
                            } else {
                                alertText += "A classificação deve ser um número entre 1 e 5."
                            }
                        } else {
                            alertText += " O campo de classificação está vazio."
                        }
                    } else {
                        alertText += " O campo de nome está vazio."
                    }
                }) {
                    Text("Save")
                }            }
        }
    }
}

#Preview {
    AddGameView()
}

//nem era pra precisar passar esses bixos ja que eles sao so as variaveis que guardam o texto dos fildes
