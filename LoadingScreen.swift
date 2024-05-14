//
//  LoadingScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.
//

import SwiftUI


 struct LoadingScreen: View {
 
 @State var isActive: Bool = false
 
 var body: some View {
 ZStack {
 if self.isActive {
 SignScreen()
 } else {
     Color.black
         .ignoresSafeArea(.all)
 ProgressView()
 .progressViewStyle(CircularProgressViewStyle(tint: .white))
 .scaleEffect(2.0, anchor: .center)
 
 }
 }
 .onAppear {
     DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
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
 
