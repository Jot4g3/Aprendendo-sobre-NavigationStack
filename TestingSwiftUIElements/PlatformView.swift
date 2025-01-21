//
//  PlatformsView.swift
//  TestingSwiftUIElements
//
//  Created by iredefbmac_33 on 19/01/25.
//

import SwiftUI

struct PlatformView: View {
    var platform : Platform = Platform(name: "PlataformaModelo01", imageName: "xbox.logo", color: .accentColor)
    
    
    init(platform: Platform) {
        self.platform = platform
    }
    
    var body: some View {
        Label(platform.name, systemImage: platform.imageName)
            .foregroundColor(platform.colorComponent.color)
            .padding(10)
    }
}

#Preview {
    PlatformView(platform: Platform(name: "PlataformaModelo01", imageName: "pc", color: .pink))
}
