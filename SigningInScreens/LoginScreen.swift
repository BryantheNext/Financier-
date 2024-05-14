//
//  LoginScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.
//

import SwiftUI
import SafariServices
import CryptoKit

struct LoginScreen: View{
    
    @State var emails = ""
    @State var password = ""
    let airCraftWhite: Color = Color(red: 0.93, green: 0.94, blue: 0.97)
    let colorScreen: Color = Color(red: 0.0078,green: 0,blue: 0.23)
    @State var showSignUpView = false
    @State var showFullAppView = false
    
    var body:some View{
        if showSignUpView{
            SignupScreen()
        }else if showFullAppView{
            SignedInMainScreen()
        }else{
            VStack{
                ZStack {
                    Image("futuristicPic")
                        .resizable()
                        .frame(width:600,height:400)
                        .position(CGPoint(x: 200.0, y: 780.0))
                    VStack{
                        Text("Log in")
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                        Spacer()
                            .frame(height:40)
                        Text("Let's Do Money Better")
                            .foregroundStyle(Color.white)
                            .font(.title)
                            .bold()
                        TextField("Email", text: $emails)
                            .font(.system(size: 30))
                            .foregroundStyle(.blue)
                            .background(airCraftWhite)
                            .clipShape(Capsule())
                            .frame(width:300,height:60)
                        TextField("Password", text: $password)
                            .font(.system(size: 30))
                            .foregroundStyle(.blue)
                            .background(airCraftWhite)
                            .clipShape(Capsule())
                            .padding()
                            .frame(width:300,height:60)
                        Button{
                            showFullAppView = true
                        }label:{
                            ZStack{
                                Capsule()
                                    .frame(width:250,height:60)
                                    .foregroundStyle(.futuristicGreen)
                                Text("Log in")
                                    .foregroundStyle(.white)
                            }
                        }
                        Spacer()
                            .frame(height:25)
                        Button{
                            
                        }label:{
                            Text("Forgot your password")
                        }
                        Spacer()
                            .frame(height:20)
                        HStack{
                            Button{
                                showSignUpView = true
                            }label:{
                                Text("Don't have a account?")
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    
                }
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .ignoresSafeArea(.all)
            .background(.purpleblueMix)
        }
    }
}
//    func safariSafariExtension(){
//        SafariExtension()
//    }

#Preview {
    LoginScreen()
}
