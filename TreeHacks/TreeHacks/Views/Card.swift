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
    var author: String
    
    @State var showVideo = false

    
    var body: some View {
           VStack {
               Image(image)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
            
               HStack {
                   VStack(alignment: .leading) {
                       Text(category)
                           .font(.headline)
                           .foregroundColor(.secondary)
                       Text(heading)
                           .font(.title)
                           .fontWeight(.black)
                           .foregroundColor(.primary)
                           .lineLimit(3)
                       Text(author.uppercased())
                           .font(.caption)
                           .foregroundColor(.secondary)
                   }
                   .layoutPriority(100)
            
                   Spacer()
               }
               .padding()
           }
            .onTapGesture {
             self.showVideo = true
            }
           .sheet(isPresented: $showVideo) {
                NavigationView {
                    NavigationLink(
                       destination: VideoPlayer()) {
                        VideoPlayer()
                     }
            }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(image: "river_bank", category: "Test", heading: "Title", author: "Sophie")
    }
}
