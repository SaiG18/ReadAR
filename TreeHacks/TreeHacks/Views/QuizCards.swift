//
//  QuizCards.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/16/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct QuizCards: View {
    
    var category: String
    var question: String
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: true) {
            VStack{
               Image("quizHeader")
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .imageScale(.small)
            }.padding(.top, 30)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            VStack{
                TapRevealQues(category: "Physics", question: "What is Acceleration?")
                TapRevealQues(category: "Physics", question: "Units for Velocity?")
                TapRevealQues(category: "Economics", question: "Who is Keynes?")
                
            }
            
        }.background(/*@START_MENU_TOKEN@*/Color("lightBlue")/*@END_MENU_TOKEN@*/)
        .edgesIgnoringSafeArea(.all)
            
    }
}

struct QuizCards_Previews: PreviewProvider {
    static var previews: some View {
        QuizCards(category: "Physics", question: "In order for a _____ process.")
    }
}
