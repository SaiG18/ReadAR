//
//  ContentView.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/15/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image("home")
                    Text("Home")
                }
            Trends()
                .tabItem {
                    Image("search")
                    Text("Trends")
                }
            Recs()
                .tabItem {
                    Image("recc")
                    Text("Reccommended")
                }
        }.background(Color(red: 242/255, green: 244/255, blue: 252/255))
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
