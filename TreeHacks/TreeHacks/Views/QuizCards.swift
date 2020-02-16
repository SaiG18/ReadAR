//
//  QuizCards.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/16/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct QuizCards: View {
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: true) {
            VStack{
               Image("quizHeader")
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .imageScale(.small)
            }.padding(.all, 30)
            .padding(.bottom, 90)
            VStack{
                TapRevealQues()
            }
            
        }.background(/*@START_MENU_TOKEN@*/Color("lightBlue")/*@END_MENU_TOKEN@*/)
        .edgesIgnoringSafeArea(.all)
            
    }
}

struct QuizCards_Previews: PreviewProvider {
    static var previews: some View {
        QuizCards()
    }
}
