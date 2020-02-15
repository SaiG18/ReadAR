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
                Card(image: "river_bank", category: "Card", heading: "Bank", author: "test", videoUrlString: "https://www.youtube.com/watch?v=HobxLbPhrMc")
                
                Card(image: "river_bank", category: "Card", heading: "Bank", author: "test", videoUrlString: "https://www.youtube.com/watch?v=HobxLbPhrMc")
            }
            
            HStack {
                Card(image: "river_bank", category: "Card", heading: "Bank", author: "test", videoUrlString: "https://www.youtube.com/watch?v=HobxLbPhrMc")
                
                Card(image: "river_bank", category: "Card", heading: "Bank", author: "test", videoUrlString: "https://www.youtube.com/watch?v=HobxLbPhrMc")
            }
        }
        .padding(.bottom, 260)
    }
}

struct Recs_Previews: PreviewProvider {
    static var previews: some View {
        Recs()
    }
}
