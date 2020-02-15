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
        TabView(selection: $selection){
            Text("Home")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("home")
                        Text("Home")
                    }
                }
                .tag(0)
            Text("Real time")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("ar")
                        Text("Real Time")
                    }
                }
                .tag(1)
            Text("Search")
            .font(.title)
            .tabItem {
                VStack {
                    Image("search")
                    Text("Search")
                }
            }
            .tag(2)
            Text("Recommended")
            .font(.title)
            .tabItem {
                VStack {
                    Image("Fourth")
                    Text("Recommended")
                }
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
