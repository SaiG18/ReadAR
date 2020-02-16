//
//  Recs.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/15/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct Recs: View {
    var body: some View {
        VStack {
            HStack {
                Card(image: "Work", category: "Physics",
                     heading: "Work",
                     videoUrlString: "https://www.youtube.com/watch?v=2WS1sG9fhOk")
                
                 Card(image: "Supply", category: "Economics", heading: "Supply", videoUrlString: "https://www.youtube.com/watch?v=nKvrbOq1OfI")
            }.padding(.top, 50)
            
            HStack {
                Card(image: "Tax", category: "Economics", heading: "Fed", videoUrlString: "https://www.youtube.com/watch?v=9gwTH4Yme8I")
                
                Card(image: "Tension", category: "Physics", heading: "Tension", videoUrlString: "https://www.youtube.com/watch?v=_UrfHFEBIpU")
            }
            
            HStack {
                Card(image: "Force", category: "Physics", heading: "Force", videoUrlString: "https://www.youtube.com/watch?v=MaabUHLIIXA")
                
                Card(image: "GDP", category: "Economics", heading: "GDP", videoUrlString: "https://www.youtube.com/watch?v=BnrBRuoVefY")
            }
            
        }
        .padding(.bottom, 100)
        .background(/*@START_MENU_TOKEN@*/Color("lightBlue")/*@END_MENU_TOKEN@*/)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Recs_Previews: PreviewProvider {
    static var previews: some View {
        Recs()
    }
}
