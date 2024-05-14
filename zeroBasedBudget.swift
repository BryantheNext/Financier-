//
//  zeroBasedBudget.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 5/13/24.
//

import SwiftUI

struct zeroBasedBudget: View {
    
    @State var back = false
    
    var body: some View{
        if back == true{
            
        }else{
            ZStack(){
                Color("purpleblueMix")
                    .ignoresSafeArea()
                ScrollView(.vertical){
                    HStack{
                        Button{
                            back = true
                        }label:{
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 30))
                                .foregroundStyle(.white)
                        }
                        HStack{
                            Text("Zero Based Budgeting:")
                                .foregroundStyle(.white)
                                .font(.system(size: 35))
                                .bold()
                        }
                    }
                    Spacer()
                        .frame(height:25)
                    Group{
                        Text("KEY TAKEAWAYS:")
                            .frame(width:350)
                            .font(.system(size: 25))
                            .foregroundStyle(.white)
                        Spacer()
                            .frame(height:20)
                        Text("The 50/30/20 budget rule states that you should spend up to 50% of your after-tax income on needs and obligations that you must have or must do.")
                            .frame(width:350)
                            .foregroundStyle(.white)
                        Spacer()
                            .frame(height:20)
                        Text("The remaining half should be split between savings and debt repayment (20%) and everything else that you might want (30%).")
                            .frame(width:350)
                            .foregroundStyle(.white)
                        Spacer()
                            .frame(height:20)
                        Text("The rule is a template that is intended to help individuals manage their money, to balance paying for necessities with saving for emergencies and retirement.")
                            .frame(width:350)
                            .foregroundStyle(.white)
                        Spacer()
                            .frame(height:20)
                        Text("People who follow the 50/30/20 rule can simplify it by setting up automatic deposits, using automatic payments, and tracking changes in income.")
                            .frame(width:350)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                        .frame(height:20)
                    Text("Pros:")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                    Text("Flexible budgets, focused operations, lower costs, and more disciplined execution")
                        .foregroundStyle(.white)
                        .frame(width:350)
                    Spacer()
                        .frame(height:20)
                    Text("Cons:")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                    Text("Variable expenses, time consuming, and an irregular or unpredictable income")
                        .foregroundStyle(.white)
                        .frame(width:350)
                    Spacer()
                        .frame(height:25)
                    Text("Model:")
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                    Image("zeroBasedBudget")
                        .resizable()
                        .frame(width:325,height: 325)
                    Spacer()
                        .frame(height:20)
                }
            }
        }
    }
}


#Preview {
    zeroBasedBudget()
}
