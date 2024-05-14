//
//  FinnanceLessonScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/17/24.
//

import SwiftUI

struct FinnanceLessonScreen:View{
    
    @State var back = true
    
    var body: some View{
        if back == true{
            
        }else{
            ZStack(){
                Color("purpleblueMix")
                    .ignoresSafeArea(.all)
                VStack{
                    
                }
            }
        }
    }
}

#Preview {
    FinnanceLessonScreen()
}

