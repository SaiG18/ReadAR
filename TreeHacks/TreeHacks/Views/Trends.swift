//
//  Search.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/15/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct Trends: View {
    var body: some View {
        ZStack{
            Color(red: 242/255, green: 244/255, blue: 252/255)
            .edgesIgnoringSafeArea(.all)
            VStack{
                Image("TrendsTop")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Trends_Previews: PreviewProvider {
    static var previews: some View {
        Trends()
    }
}
