//
//  TapRevealQues.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/16/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct TapRevealQues: View {
    var body: some View {
        VStack {
                   HStack {
                       VStack(alignment: .leading) {
                           Text("SwiftUI")
                               .font(.headline)
                               .foregroundColor(.secondary)
                           Text("What is the ")
                               .font(.title)
                               .fontWeight(.black)
                               .foregroundColor(.primary)
                               .lineLimit(3)
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
        TapRevealQues()
    }
}
