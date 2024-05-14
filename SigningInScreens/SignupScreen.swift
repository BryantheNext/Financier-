//
//  SignupScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.
//

import SwiftUI
import SafariServices
import CryptoKit

struct SignupScreen: View{
    
    @State var email = ""
    @State var password = ""
    @State var name = ""
    
    let airCraftWhite: Color = Color(red: 0.93, green: 0.94, blue: 0.97)
    
    @State var showLoginView = false
    @State var showFullAppView = false
    @State private var showSafari: Bool = false
    
    private var emailRequiremnts: Array<Bool>{
        [
            email == "gmail.com"
        ]
    }
    
    private var passWordrequirements: Array<Bool> {
        [
            password.count >= 7,             // Minimum Length
            password == "[0-9]",             // One Number
            password == ".*[^A-Za-z0-9].*"   // One Special Character
        ]
    }
    @State var informationComplete = false
    
    var body:some View{
        if showLoginView{
            LoginScreen()
        } else if showFullAppView{
            LoadingScreen()
        }else{
            VStack{
                ZStack {
                    Image("signUpScreen")
                        .resizable()
                        .frame(width:500,height:400)
                        .opacity(0.999)
                        .position(CGPoint(x: 140.0, y: 780.0))
                    VStack{
                        Text("Sign Up")
                            .font(.system(size: 50))
                            .foregroundStyle(.white)
                        Spacer()
                            .frame(height:40)
                        Text("Enpower Your Future")
                            .foregroundStyle(Color.white)
                            .font(.title)
                            .bold()
                        if informationComplete == true{
                            Spacer()
                                .frame(height:30)
                            TextField("First Name", text: $name)
                                .font(.system(size: 30))
                                .foregroundStyle(.blue)
                                .background(airCraftWhite)
                                .clipShape(Capsule())
                                .frame(width:300,height:50)
                            Spacer()
                                .frame(height:30)
                            Button{
                                showFullAppView = true
                                showFullAppView = true
                            }label:{
                                ZStack{
                                    Capsule()
                                        .frame(width:250,height:60)
                                        .foregroundStyle(.futureisticPink)
                                    Text("Sign Up")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                            }
                        }else{
                            VStack{
                                TextField("Email", text: $email)
                                    .font(.system(size: 30))
                                    .foregroundStyle(.blue)
                                    .background(airCraftWhite)
                                    .clipShape(Capsule())
                                    .frame(width:300,height:60)
                                // UserDefaults.standard.set(email, forKey: "userEmail")
                                TextField("Password", text: $password)
                                    .font(.system(size: 30))
                                    .foregroundStyle(.blue)
                                    .background(airCraftWhite)
                                    .clipShape(Capsule())
                                    .padding()
                                    .controlSize(.large)
                                    .frame(width:300,height:50)
                                    .onSubmit {
                                        print(password)
                                    };                            Button{
                                        informationComplete = true
                                    }label:{
                                        ZStack{
                                            Capsule()
                                                .frame(width:250,height:60)
                                                .foregroundStyle(.futureisticPink)
                                            Text("Continue")
                                                .bold()
                                                .foregroundStyle(.white)
                                        }
                                    }
                                Spacer()
                                    .frame(height: 25)
                            }
                        }
                        Button{
                            showLoginView = true
                        }label:{
                            Text("Already have a account?")
                                .font(.system(size: 18))
                                .foregroundStyle(.white)
                                .bold()
                        }
                        Spacer()
                            .frame(height:15)
                        Text("Privacy Notice")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                            .bold()
                            .onTapGesture {
                                showSafari.toggle()
                            }
                            .fullScreenCover(isPresented: $showSafari, content: {
                                SFSafariViewWrapper(url: URL(string: "https://docs.google.com/document/d/1nhJwJQ6iZ2pOoivH-fQOKwMNvhMoFvUObRoUiTw9ADM/edit?usp=sharing")!)
                            })
                        
                        Spacer()
                            .frame(height:70)
                    }
                    
                }
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .ignoresSafeArea(.all)
            .background(.purpleblueMix)
        }
    }
    //    func encryptPassword(password: String) -> String {
    //        let salt = "mysalt"
    //        let saltedPassword = password + salt
    //        
    //        guard let saltedPasswordData = saltedPassword.data(using: .utf8) else {
    //            return ""
    //        }
    //        
    //        let hashedPassword = SHA256.hash(data: saltedPasswordData)
    //        let hashedPasswordString = hashedPassword.compactMap { String(format: "%02x", $0) }.joined()
    //        
    //        return hashedPasswordString
    //    }
    /*
     struct SFSafariViewWrapper: UIViewControllerRepresentable {
     let url: URL
     
     func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
     return SFSafariViewController(url: url)
     }
     
     func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
     return
     }
     }
     }
     */
}
#Preview {
    SignupScreen()
}

