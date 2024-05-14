//
//  EmailSettingsScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/17/24.
//

import SwiftUI


struct EmailSettingsScreen: View{
    var body: some View{
        List{
            Button{
                
            }label:{
                Text("Change Email")
            }
        }
        .navigationTitle("Email")
        .scrollContentBackground(.hidden)
        .background(.black)
        .listRowSeparatorTint(.white)
        .listRowBackground(Color.black)
    }
}
#Preview{
    EmailSettingsScreen()
}
