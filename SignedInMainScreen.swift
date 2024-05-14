//
//  MainPageScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/16/24.
//
 
 import SwiftUI
 import SafariServices
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
 
struct SignedInMainScreen:View{
    
    @State var balance = 0
    @State var name = ""
    @State var monthExpenses = 0
    @State var weekExpenses = 0
    @State var dayExpenses = 0
    
    @State var showStatsScreen: Bool = false
    @State var showMainScreen: Bool = false
    @State var showServicesScreen: Bool = false
    @State var showSettingsScreen: Bool = false
    
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
    
    var body: some View{
        if showStatsScreen{
            statsScreen()
        }
        else if showMainScreen{
            FrontScreen()
        }
        else if showServicesScreen{
            FullApp()
        } else if showSettingsScreen{
            settingScreen()
        } else{
            ScrollView(.vertical){
                ZStack{
                    Text("Welcome,\n\(name)")
                        .font(.system(size: 50))
                        .bold()
                        .position(CGPoint(x: 140.0, y: 90.0))
                        .foregroundStyle(.white)
                    Divider()
                        .frame(minHeight: 5)
                        .overlay(Color.white)
                        .position(CGPoint(x: 190.0, y: 175.0))
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
                                    .foregroundStyle(Color("futureistic"))
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
                            /*
                             
                             
                             Make more characters.
                             
                             Jacob Lawson was a college student with big dreams, but a tight budget. He had taken out an expensive loan to pay for his tuition, and now he was struggling to make ends meet. Despite working part-time, Jacob found himself constantly stressed about money.
                             
                             One day, a friend told Jacob about a financial management app called Financier. Intrigued, Jacob decided to give it a try. As he started using the app, he realized just how much money he had been wasting on irrational spending and unmonitored expenses.
                             
                             With the help of Financier, Jacob was able to track his spending, set up a budget, and keep an eye on his bills. He also learned how to differentiate between what he needs and what he wants, allowing him to cut back on unnecessary expenses.
                             
                             Thanks to Financier, Jacob developed a strategy to save money and was given helpful advice on how to manage his finances effectively. He learned to prioritize his expenses, set aside money for savings, and avoid impulse purchases.
                             
                             As a result, Jacob started to see a significant improvement in his financial situation. He no longer lived paycheck to paycheck, and was able to set aside money for emergencies and future expenses. With Financier by his side, Jacob was on track to achieving his financial goals and building a secure future for himself.
                             */
                            Spacer()
                                .frame(width:50)
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width:150,height:200)
                                    .foregroundStyle(Color("futuristicPink"))
                                Text("Income Ratio:\n\(balance)")
                                    .font(.system(size: 23))
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .position(CGPoint(x: 200.0, y: 425.0))
                    VStack{
                        Divider()
                            .frame(minHeight: 0.5)
                            .overlay(Color.white)
                            .position(CGPoint(x: 190.0, y: 715.0))
                    }
                }
                .background(.twitter)
                ZStack{
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
                        .position(CGPoint(x: 65.0, y: 755.0))
                    }
                    Button{
                        showSettingsScreen = true
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
                    .position(CGPoint(x: 235.0, y: 755.0))
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
                    .position(CGPoint(x: 150.0, y: 755.0))
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
                    .position(CGPoint(x: 320.0, y: 755.0))
                }
                .frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.bottom)
                }
            .frame(maxWidth:.infinity,maxHeight:.infinity,alignment:.bottom)
                .background(.twitter)
        }
    }
        
}

#Preview {
    SignedInMainScreen()
}
