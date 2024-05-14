//
//  FullApp.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 3/21/24.
//

import SwiftUI
import SafariServices
import Charts

enum LineChartType: String, CaseIterable, Plottable {
    case optimal = "Optimal"
    case outside = "Outside range"
    
    var color: Color {
        switch self {
        case .optimal: return .green
        case .outside: return .blue
        }
    }
    
}

struct LineChartData {
    
    var id = UUID()
    var date: Date
    var value: Double
    
    var type: LineChartType
}

struct LineChartView: View {
    
    let data: [LineChartData]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Line Chart")
                .font(.system(size: 16, weight: .medium))
            
            Chart {
                ForEach(data, id: \.id) { item in
                    LineMark(
                        x: .value("Weekday", item.date),
                        y: .value("Count", item.value)
                    )
                }
            }
        }
        .frame(height: 360)
    }
}

extension Date {
    func adding (_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
        return calendar.date(byAdding: component, value: value, to: self)
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}

//Front Screen and its views

struct FrontScreen:View{
    
    let pink: Color = Color(red: 0.949, green:0.216,blue:1)
    let carriabeanGreen: Color = Color(red: 0.055,green: 1,blue: 0.635)
    let purple: Color = Color(red: 0.392,green: 0.255,blue: 0.647)
    let bottomBlack: Color = Color(red: 0.145,green: 0.157, blue: 0.167)
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
            settingsScreen()
        } else{
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
                                .foregroundStyle(pink)
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
                                .foregroundStyle(carriabeanGreen)
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
                                .foregroundStyle(purple)
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
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .background(.black)
        }
    }
}

#Preview {
    FrontScreen()
}
struct FullApp: View {
    
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
            FrontScreen()
        }
        else if showServicesScreen {
            FullApp()
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
    FullApp()
}

struct EmailSettings: View{
    var body: some View{
          List{
                Button{
                    
                }label:{
                    Text("Change Email")
                }
            }
          .navigationTitle("Email")
        .scrollContentBackground(.hidden)
        .background(.black)
        .listRowSeparatorTint(.white)
        .listRowBackground(Color.black)
    }
}
#Preview{
    EmailSettings()
}

struct PasswordSettings: View{
    var body: some View{
        List{
            Button{
                
            }label:{
                Text("Change Password")
            }
        }
        .scrollContentBackground(.hidden)
        .background(.black)
        .listRowBackground(Color.black)
        .listRowSeparatorTint(.white)
    }
}
#Preview{
    PasswordSettings()
}

struct NotificationSettings: View{
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
    NotificationSettings()
}









//Full App View views



struct CardView: View {
    
    let creditCardInfo: CreditCardInfo
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .padding()
                Spacer()
                Text("VISA")
                    .font(.system(size:18, weight: .bold, design: .monospaced))
                    .italic()
                    .padding()
            }
            Text(creditCardInfo.cardNumber)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .padding()
            HStack{
                VStack(alignment: .leading){
                    Text("Card Holder")
                        .opacity(0.5)
                        .font(.system(size:14))
                    Text(creditCardInfo.cardHolderName)
                }
                Spacer()
                
                VStack(alignment:.leading){
                    Text("EXPIRES")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(creditCardInfo.expiriationDate)
                }
            }.padding()
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(width:350,height:250)
        .background{
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint:.bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerRadius:25.0, style: .continuous))
    }
}

struct CreditCardInfo {
    var cardHolderName: String = ""
    var cardNumber: String = ""
    var expiriationDate: String = ""
    var ccvCode: String = ""
}

extension CreditCardInfo {
    static let demoCard1 = CreditCardInfo(cardHolderName: "John Doe", cardNumber: "444 444  4453 434", expiriationDate: "10/27", ccvCode: "333")
}

struct cardInformation: View {
    
    @Binding var creditCardInfo: CreditCardInfo
    
    var body: some View{
        Form {
            TextField("Cardholder's Name", text: $creditCardInfo.cardHolderName)
            
            TextField("Card Number", text: $creditCardInfo.cardNumber)
            
            TextField("Expiry Date", text: $creditCardInfo.expiriationDate)
            
            TextField("CCV", text: $creditCardInfo.ccvCode)
        }
        .scrollContentBackground(.hidden)
        .background(.black)
    }
}

struct contentObserve: View{
    
    // @State private var creditCardInfo = CreditCardInfo()
    @State private var creditCardInfo = CreditCardInfo.demoCard1

    var body: some View {
            VStack{
                CardView(creditCardInfo: creditCardInfo)
                Spacer()
                cardInformation(creditCardInfo: $creditCardInfo)
            }
        //Make the navigation Title text appear
        .navigationTitle("Your Card:")
        //.navigationBarColor(.white)
        //.navigationBarColor(.white)
        .background(.black)
    }
}

#Preview {
    NavigationStack {        // contentObserve(creditCardInfo: CreditCardInfo.demoCard1)
    contentObserve()
    }
}




