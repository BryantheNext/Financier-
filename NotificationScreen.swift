//
//  NotificationScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/17/24.
//

import SwiftUI

struct NotificationScreen: View{
    var body: some View{
        List{
            Text("Add Notifications")
        }
        .scrollContentBackground(.hidden)
        .background(.black)
        .listRowBackground(Color.black)
        .listRowSeparatorTint(.white)
    }
}
#Preview{
    NotificationScreen()
}
