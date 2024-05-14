//
//  WelcomeScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.

import SwiftUI
import SafariServices
import CryptoKit

struct WelcomeScreen: View {
    
    let quoteArray = ["“The way to get started is to quit talking and begin doing.” \n– Walt Disney"]
    @State var choosen = 0
    let airCraftWhite: Color = Color(red: 0.93, green: 0.94, blue: 0.97)
    @State var showLoginview = false
    @State var showSignUpView = false
    @State private var showSafari: Bool = false
    
    //    @Binding var logInVar: Bool
    
    var body: some View{
        if showLoginview {
            LoginScreen()
        }
        else if showSignUpView {
            SignupScreen()
        } else {
            VStack{
                VStack{
                    Spacer()
                        .frame(height:50)
                    ZStack{
                        Image("launchScreen")
                            .resizable()
                            .frame(width:380,height:200)
                        Text("Privacy Policy")
                            .foregroundStyle(.white)
                            .position(CGPoint(x: 190.0, y: 5.0))
                            .frame(width:120)
                            .bold()
                            .font(.system(size: 13))
                            .onTapGesture {
                                showSafari.toggle()
                            }
                            .fullScreenCover(isPresented: $showSafari, content: {
                                SFSafariViewWrapper(url: URL(string: "https://docs.google.com/document/d/1nhJwJQ6iZ2pOoivH-fQOKwMNvhMoFvUObRoUiTw9ADM/edit?usp=sharing")!)
                            })
                        
                    }
                    Text("Advisor, Educator, Manager, Calculator")
                        .foregroundStyle(.mint)
                        .font(.system(size:16.5))
                        .bold()
                    Spacer()
                        .frame(height:20)
                    Text(quoteArray[choosen])
                        .font(.custom("Proxima Nova",size: 23))
                        .foregroundStyle(.white)
                        .frame(width:380)
                        .italic()
                        .bold()
                        .frame(width:400)
                }
                ZStack {
                    Image("imageScreen")
                        .resizable()
                        .frame(width:780,height:780)
                        .position(CGPoint(x: 200.0, y: 480.0))
                    VStack{
                        Button{
                            showSignUpView = true
                        }label:{
                            ZStack{
                                Capsule()
                                    .frame(width:250,height:50)
                                    .foregroundStyle(.futureisticPink)
                                Text("Sign Up")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        Button{
                            showLoginview = true
                        }label:{
                            ZStack{
                                Capsule()
                                    .frame(width:250,height:50)
                                    .foregroundStyle(.futuristicGreen)
                                Text("Log In")
                                    .foregroundStyle(Color.white)
                                    .bold()
                            }
                        }
                        Spacer()
                            .frame(height:0)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.purpleblueMix)
            .ignoresSafeArea(.all)
        }
    }
    func safariExtension(){
      safariExtension()
    }
}

#Preview {
    WelcomeScreen()
}
