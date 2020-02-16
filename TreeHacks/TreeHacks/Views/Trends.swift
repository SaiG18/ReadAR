//
//  Search.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/15/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct Trends: View {
    
    var items = ["TrendsTop", "TrendsBottom"]
                 
    var body: some View {
    
        ScrollView(Axis.Set.vertical, showsIndicators: true) {
            VStack {
                ForEach(self.items, id: \.self) { item in
                    Image(item)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Trends_Previews: PreviewProvider {
    static var previews: some View {
        Trends()
    }
}
