//
//  settingScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 5/13/24.
//

import SwiftUI

struct settingScreen: View {
    
    @State private var showSafari: Bool = false
    @State private var showingAlert = false
    
    @State var notificationScreen: Bool = false
    @State var emailScreen: Bool = false
    @State var passwordScreen: Bool = false
    
    @State var showMainScreen = false
    @State var showServicesScreen = false
    @State var showSettingsScreen = false
    @State var showSTATScreen = false
    
    @State var notiChecked = false
    
    var body: some View {
        if emailScreen{
            EmailSettings()
        }else if passwordScreen{
            PasswordSettings()
        } else if notificationScreen{
            NotificationSettings()
        } else if showMainScreen{
            FrontScreen()
        } else if showMainScreen{
            FullApp()
        } else if showSettingsScreen{
            settingsScreen()
        } else if showSTATScreen{
            statsScreen()
        }else{

            List {
                Section {
                    HStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width:20,height:20)
                        VStack{
                            Text("Bryan Leos")
                                .foregroundStyle(.white)
                                .bold()
                        }
                        
                    }
                    .listRowBackground(Color("twitterColor"))
                } header:{
                    Text("Account")
                        .foregroundStyle(.white)
                }
                
                Section {
                    
                    Group{
//                        GeneralItem1(notiChecked: .constant(false))
                        GeneralItem1()
                        GeneralItem2()
                        GeneralItem3()
                    }
                    .listRowBackground(Color("twitterColor"))
                } header:{
                    Text("General")
                        .foregroundStyle(.white)
                }
            }
            .navigationTitle("Settings")
            .scrollContentBackground(.hidden)
            .background(Color("purpleblueMix"))
            .padding(-10)
            ZStack{
                Color("purpleblueMix")
                    .ignoresSafeArea()
                HStack{
                    Button{
                         showMainScreen = true
                    }label:{
                        VStack{
                            Image(systemName: "book.closed")
                                .resizable()
                                .frame(width:27,height:27)
                            
                                .foregroundStyle(.white)
                            Text("Main")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 14))
                        }
                    }
                    Spacer()
                        .frame(width:45)
                    Button{
                         showSTATScreen = true
                    }label:{
                        VStack{
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .resizable()
                                .frame(width:27,height:27)
                                .foregroundStyle(.white)
                            Text("Stats")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 14))
                        }
                    }
                    Spacer()
                        .frame(width:45)
                    Button{
                        showServicesScreen = true
                    }label:{
                        VStack{
                            Image(systemName: "archivebox")
                                .resizable()
                                .frame(width:27,height:27)
                                .foregroundStyle(.white)
                            Text("Services")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 14))
                        }
                    }
                    Spacer()
                        .frame(width:45)
                    Button{
                        showSettingsScreen = true
                    }label:{
                        VStack{
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width:27,height:27)
                                .foregroundStyle(.white)
                            Text("Settings")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 14))
                        }
                    }
                }
            }
            .frame(height:0)
        }
    }
}

#Preview {
    settingScreen()
}

struct GeneralItem1: View {

    //@Binding var notiChecked: Bool
    
    var body: some View {
        Button{
       // notiChecked = true
        }label:{
            HStack{
                Image(systemName: "bell.fill")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width:20,height:20)
                VStack{
                    Text("Notifications")
                        .foregroundStyle(.white)
                        .bold()
                }
            }
        }
    }
}


struct GeneralItem2: View {
    
    //@Binding var privacyNotice: Bool
    
    var body: some View {
            HStack{
                Image(systemName: "")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width:20,height:20)
                VStack{
                    Text("Privacy Notice")
                        .foregroundStyle(.white)
                        .bold()
            }
        }
//            .onTapGesture {
//                showSafari.toggle()
//            }
//            .fullScreenCover(isPresented: $showSafari, content: {
//                SFSafariViewWrapper(url: URL(string: "https://docs.google.com/document/d/1nhJwJQ6iZ2pOoivH-fQOKwMNvhMoFvUObRoUiTw9ADM/edit?usp=sharing")!)
//            })

    }
}
struct GeneralItem3: View {
    
    //@Binding var logOut: Bool
    //goWelcomeScreen = false
    
    var body: some View {
        Button{
            //logOut = true
        }label:{
            HStack{
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width:20,height:20)
                VStack{
                    Text("Log Out")
                        .foregroundStyle(.white)
                        .bold()
                }
            }
        }
        /*
         .alert(isPresented:$logout) {
         Alert(
         title: Text("Are you sure you want to Log out?"),
         message: Text("You have to log back in"),
         primaryButton: .destructive(Text("Log Out")) {
         goWelcomeScreen = true
         },
         secondaryButton: .cancel()
         )

         */
    }
}




