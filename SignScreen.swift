//
//  SignScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 5/13/24.
//


/*
 
 
 Make more characters.
 
 Jacob Lawson was a college student with big dreams, but a tight budget. He had taken out an expensive loan to pay for his tuition, and now he was struggling to make ends meet. Despite working part-time, Jacob found himself constantly stressed about money.
 
 One day, a friend told Jacob about a financial management app called Financier. Intrigued, Jacob decided to give it a try. As he started using the app, he realized just how much money he had been wasting on irrational spending and unmonitored expenses.
 
 With the help of Financier, Jacob was able to track his spending, set up a budget, and keep an eye on his bills. He also learned how to differentiate between what he needs and what he wants, allowing him to cut back on unnecessary expenses.
 
 Thanks to Financier, Jacob developed a strategy to save money and was given helpful advice on how to manage his finances effectively. He learned to prioritize his expenses, set aside money for savings, and avoid impulse purchases.
 
 As a result, Jacob started to see a significant improvement in his financial situation. He no longer lived paycheck to paycheck, and was able to set aside money for emergencies and future expenses. With Financier by his side, Jacob was on track to achieving his financial goals and building a secure future for himself.
 */

import SwiftUI
import Charts


// enum LineChartType: String, CaseIterable, Plottable {
// case optimal = "Optimal"
// case outside = "Outside range"
//
// var color: Color {
// switch self {
// case .optimal: return .green
// case .outside: return .blue
// }
// }
//
// }
//
// struct LineChartData {
//
// var id = UUID()
// var date: Date
// var value: Double
//
// var type: LineChartType
// }
//
// struct LineChartView: View {
//
// let data: [LineChartData]
//
// var body: some View {
// VStack(alignment: .leading) {
// Text("Line Chart")
// .font(.system(size: 16, weight: .medium))
//
// Chart {
// ForEach(data, id: \.id) { item in
// LineMark(
// x: .value("Weekday", item.date),
// y: .value("Count", item.value)
// )
// }
// }
// }
// .frame(height: 360)
// }
// }
//
// extension Date {
// func adding (_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
// return calendar.date(byAdding: component, value: value, to: self)
// }
//
// var startOfDay: Date {
// return Calendar.current.startOfDay(for: self)
// }
// }
//
//


struct SignScreen: View {
    
    @State var mainPage = false
    @State var statsPage = false
    @State var servicesPage = false
    @State var settingsPage = false
    
    var chartData : [LineChartData] = {
        let sampleDate = Date().startOfDay.adding(.month, value: -10)!
        var temp = [LineChartData]()
        
        // Line 1
        for i in 0..<8 {
            let value = Double.random(in: 5...20)
            temp.append(
                LineChartData(
                    date: sampleDate.adding(.month, value: i)!,
                    value: value,
                    type: .outside
                )
            )
        }
        
        return temp
    }()
    
    var body: some View {
        if mainPage == true {
          SignScreen()
        }else if statsPage == true{
            statsScreen()
        }else if servicesPage == true{
            AppFunctionScreen()
        }else if settingsPage == true{
            settingScreen()
        }else{
            ZStack{
                Color("purpleblueMix")
                    .ignoresSafeArea(.all)
                ScrollView(.vertical){
                    LazyVStack(spacing: 1, pinnedViews:[.sectionFooters], content: {
                        Section{
                            MeetInformation()
                        } footer: {
                            NavigationButton()
                        }
                    })
                }
            }
        }
    }
}
#Preview {
    SignScreen()
}

struct MeetInformation: View{
    
    @State var balance = 0
    @State var name = ""
    @State var monthExpenses = 0
    @State var weekExpenses = 0
    @State var dayExpenses = 0
    
    var body: some View{
        HStack{
            Text("Welcome,\n\(name)")
            //Text("Hi")
                .font(.system(size: 50))
                .bold()
                .foregroundStyle(.white)
            Spacer()
                .frame(width:90)
        }
        Divider()
            .frame(minHeight: 5)
            .overlay(Color.white)
        VStack{
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:150,height:200)
                        .foregroundStyle(.red)
                    Text("Balance:\n\(balance)")
                        .font(.system(size: 25))
                        .bold()
                        .foregroundStyle(.white)
                }
                Spacer()
                    .frame(width:50)
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:159,height:200)
                        .foregroundStyle(Color("futureisticPink"))
                    Text("Month expenses:\n\(monthExpenses)\n Week expenses:\n\(weekExpenses)\n Day expenses:\n\(dayExpenses)")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundStyle(.white)
                }
            }
            .padding()
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:150,height:200)
                        .foregroundStyle(Color("futuristicGreen"))
                    Text("Budget:\n\(balance)")
                        .font(.system(size: 25))
                        .bold()
                        .foregroundStyle(.white)
                }
                
                Spacer()
                    .frame(width:50)
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width:150,height:200)
                        .foregroundStyle(Color("futuristicPurple"))
                    Text("Income Ratio:\n\(balance)")
                        .font(.system(size: 23))
                        .bold()
                        .foregroundStyle(.white)
                }
            }
        }
        VStack{
            Divider()
                .frame(minHeight: 0.5)
                .overlay(Color.white)
        }
    }
}

struct NavigationButton: View{
    
    @State var showSTATScreen: Bool = false
    @State var showMainScreen: Bool = false
    @State var showServicesScreen: Bool = false
    @State var showSettingsScreen: Bool = false
    
    var body: some View {
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
}


