//
//  settingsScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.
//

import SwiftUI


struct settingsScreen: View {
    
    @State private var showSafari: Bool = false
    @State private var showingAlert = false
    
    @State var notificationScreen: Bool = false
    @State var emailScreen: Bool = false
    @State var passwordScreen: Bool = false
    
    @State var showMainScreen = false
    @State var showServicesScreen = false
    @State var showSettingsScreen = false
    @State var showSTATScreen = false
    
   // let SpotifyMain = UIColor(named: "SpotifyBlack")
    
//    let appleDarkMode: Color = Color(red:0.11, green:0.11, blue:0.1176)
    
    var body: some View{
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
            VStack{
                Text("Settings")
                    .foregroundStyle(.white)
                    .font(.system(size: 50))
                Divider()                   
                    .frame(minHeight: 1)
                    .overlay(Color.white)
                Spacer()
                    .frame(height:30)
                HStack{
                    VStack{
                        Button{
                            notificationScreen = true
                        }label:{
                            Image(systemName: "at")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width:20,height:20)
                            VStack{
                                Text("Email")
                                    .foregroundStyle(.white)
                                    .bold()
                                Text("Add/Delete/Card")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 15))
                            }
                            Spacer()
                        }
                        Spacer()
                            .frame(height:40)
                        HStack{
                            Button{
                                // showCalculator = true
                            }label:{
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width:20,height:25)
                                VStack{
                                    Text("Password")
                                        .foregroundStyle(.white)
                                        .bold()
                                    Text("Cash Spending/")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 15))
                                }
                            }
                            Spacer()
                        }
                        HStack{
                            Button{
                                // showSavingManage = true
                            } label:{
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width:20,height:25)
                                VStack{
                                    Text("Notifications")
                                        .foregroundStyle(.white)
                                        .bold()
                                    Text("Manage/Plan")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 15))
                                }
                            }
                            Spacer()
                        }
                        
                        HStack{
                            Button{
                                
                            }label:{
                                Text("Privacy Notice")
                                    .foregroundStyle(.white)
                                    .bold()
                                    .onTapGesture {
                                        showSafari.toggle()
                                    }
                                    .fullScreenCover(isPresented: $showSafari, content: {
                                        SFSafariViewWrapper(url: URL(string: "https://docs.google.com/document/d/1nhJwJQ6iZ2pOoivH-fQOKwMNvhMoFvUObRoUiTw9ADM/edit?usp=sharing")!)
                                    })
                                Spacer()
                            }
                        }
                        HStack{
                            Button{
                                // showSavingManage = true
                            } label:{
                                Image(systemName:"rectangle.portrait.and.arrow.forward")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width:25,height:25)
                                    .alert("Log out?", isPresented: $showingAlert) {
                                        Button("OK", role: .cancel) { }
                                    }
                                VStack{
                                    Text("Log out")
                                        .foregroundStyle(.white)
                                        .bold()
                                        .alert("Log out?", isPresented: $showingAlert) {
                                            Button("OK", role: .cancel) { }
                                        }
                                    Text("Manage/Plan")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 15))
                                        .alert("Log out?", isPresented: $showingAlert) {
                                            Button("OK", role: .cancel) { 
                                                
                                            }
                                        }
                                }
                            }
                            Spacer()
                        }
                        HStack{
                            Button{
                                // showSavingManage = true
                            } label:{
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width:20,height:25)
                                VStack{
                                    Text("Delete Account")
                                        .foregroundStyle(.white)
                                        .bold()
                                    Text("Manage/Plan")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 15))
                                }
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
                Divider()
                    .frame(minHeight: 1)
                    .overlay(Color.white)
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("SpotifyMain"))
        }
        
    }
    func safariExtension(){
        safariExtension()
    }

}
#Preview {
    settingsScreen()
}
