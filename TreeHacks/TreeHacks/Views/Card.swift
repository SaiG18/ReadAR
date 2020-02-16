//
//  Card.swift
//  TreeHacks
//
//  Created by Sophie Berger on 15.02.20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct Card: View {
    var image: String
    var category: String
    var heading: String
    var videoUrlString: String
    
    @State var showVideo = false
    
    func  chooseColor() -> Color {
           if (category == "Physics") {
               return Color(red: 140/255, green: 84/255, blue: 255/255)
           } else {
               return Color(red: 5/255, green: 194/255, blue: 213/255)
           }
       }
    
    var body: some View {
           VStack {
               Image(image)
                   .resizable()
                .aspectRatio(contentMode: .fit)
               HStack {
                   VStack(alignment: .leading) {
                       Text(category)
                           .font(.headline)
                        .foregroundColor(chooseColor())
                       Text(heading)
                           .font(.title)
                           .fontWeight(.black)
                           .foregroundColor(.primary)
                           .lineLimit(3)
                   }
                   Spacer()
               }
               .padding()
            }
            .onTapGesture {
             self.showVideo = true
            }
           .sheet(isPresented: $showVideo) {
                VideoPlayer(urlString: self.videoUrlString)
            }
        .cornerRadius(10)
        .shadow(radius: 40)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(image: "Supply", category: "Test", heading: "Title", videoUrlString: "https://www.youtube.com/watch?v=HobxLbPhrMc")
    }
}
