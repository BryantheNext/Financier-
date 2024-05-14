//
//  AppFunctionScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.
//

import SwiftUI

//struct AppFunctionScreen: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    AppFunctionScreen()
//}


 struct AppFunctionScreen: View {
 
 @State var showCreditCard = false
 @State var showCalculator = false
 @State var showSavingManage = false
 
 @State var showMainScreen = false
 @State var showServicesScreen = false
 @State var showSettingsScreen = false
 @State var showSTATScreen = false
 
 let picArray = ["managingMan","onMoneyTrans"]
 @State var choosen = 1
 
 var body: some View {
 if showCreditCard{
 contentObserve()
 } else if showCalculator{
 CalculatorScreen()
 }
 else if showSavingManage{
 FinnanceLessonScreen()
 }
 else if showMainScreen {
     SignedInMainScreen()
 }
 else if showServicesScreen {
     AppFunctionScreen()
 }
 else if showServicesScreen {
 settingsScreen()
 }
 else if showSTATScreen {
 statsScreen()
 }
 else{
 VStack{
 Image(picArray[choosen])
 .resizable()
 .frame(width:250,height:250)
 .padding()
 Divider()
 .frame(minHeight: 1)
 .overlay(Color.white)
 Spacer()
 .frame(height:38)
 HStack{
 VStack{
 Button{
 //showCreditCard = true
 }label:{
 HStack{
 Image("cardImage")
 .resizable()
 .frame(width:40,height:40)
 VStack{
 Text("Credit Card")
 .foregroundStyle(.white)
 .bold()
 Text("Add/Delete/Card")
 .foregroundStyle(.gray)
 .font(.system(size: 15))
 }
 Spacer()
 }
 }
 HStack{
 Button{
 // showCalculator = true
 }label:{
 Image("calculator")
 .resizable()
 .frame(width:50,height:50)
 VStack{
 Text("Calculator")
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
 Image("manangeButton")
 .resizable()
 .frame(width:42,height:42)
 //.padding(.horizontal, -50)
 VStack{
 Text("Finnance Planning")
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
 .background(.black)
 }
 }
 }
 
 
 #Preview {
 AppFunctionScreen()
 }

 
