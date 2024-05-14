//
//  PasswordSettingScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/17/24.
//

import SwiftUI

struct PasswordSettingScreen: View{
    var body: some View{
        List{
            Button{
                
            }label:{
                Text("Change Password")
            }
        }
        .scrollContentBackground(.hidden)
        .background(.black)
        .listRowBackground(Color.black)
        .listRowSeparatorTint(.white)
    }
}
#Preview{
    PasswordSettingScreen()
}
