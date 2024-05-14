//
//  OpeningScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.
//

import SwiftUI

struct OpeningScreen: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                WelcomeScreen()
            } else {
                Rectangle()
                    .background(.twitter)
                    .ignoresSafeArea(.all)
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    OpeningScreen()
}

