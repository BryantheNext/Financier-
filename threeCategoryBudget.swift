//
//  threeCategoryBudget.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 5/13/24.
//

import SwiftUI

struct threeCategoryBudget: View {
    
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
                            Text("50, 30,20 Method:")
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
                    Text("This budgeting method is a great option for newbie budgeters because it doesn’t require meticulous tracking of all your expenses. You can succeed with this budget if you know what counts as a want versus a need and are motivated to set aside enough money toward savings and debt.")
                        .foregroundStyle(.white)
                        .frame(width:350)
                    Spacer()
                        .frame(height:20)
                    Text("Cons:")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                    Text("The main drawback is that the 50/30/20 rule might be unrealistic for people with significant debt or high savings goals because 20% of your income might not stretch far enough.")
                        .foregroundStyle(.white)
                        .frame(width:350)
                    Spacer()
                        .frame(height:20)
                    Text("50% = 0.5   30% = 0.3    20% = 0.2")
                        .foregroundStyle(.white)
                    Spacer()
                        .frame(height:25)
                    Text("Model:")
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                    Image("fiftyThirityTwentyMethod")
                        .resizable()
                        .frame(width:325,height: 325)
                    Spacer()
                        .frame(height:20)
                    Text("Example:")
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                    Group{
                        Text("Amount Of Cash = 300")
                        Text("Needs: 300 x 0.5(50%) = 150")
                        Text("Wants: 300 x 0.3(30%) = 90")
                        Text("Savings: 300 x 0.2(20%) = 60")
                        Text("150(Needs) + 90(Wants) + 60(Savings) = 300(Amount Of Cash)")
                        
                        
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    threeCategoryBudget()
}
