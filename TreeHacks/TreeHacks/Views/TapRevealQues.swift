//
//  TapRevealQues.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/16/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct TapRevealQues: View {
    
    var category: String
    var question: String
    @State var name: String = ""
    
    var body: some View {
        VStack {
                   HStack {
                       VStack(alignment: .leading) {
                           Text(category)
                               .font(.headline)
                               .foregroundColor(.secondary)
                           Text(question)
                               .font(Font.system(size: 22))
                               .fontWeight(.heavy)
                               .foregroundColor(.primary)
                               .lineLimit(3)
                            TextField("Answer", text: $name)
                            .padding(.top, 10.0)
                            .padding(.leading, 50.0)
                            .padding(.bottom, 10.0)
                            .foregroundColor(.black)
                            .border(Color("lighterGray"), width: 4)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20.0)
                       }
                       .layoutPriority(100)
                       Spacer()
                   }
                   .padding()
               }
               .cornerRadius(10)
               .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                 .shadow(radius: 15,x: -10.0, y: -10.0)
                        
               )
            .background(Color.white)
               .padding([.top, .horizontal])
    }
}

struct TapRevealQues_Previews: PreviewProvider {
    static var previews: some View {
        TapRevealQues(category: "Physics", question: "In order for a _____ process.")
    }
}
