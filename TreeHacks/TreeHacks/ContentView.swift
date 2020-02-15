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
<<<<<<< HEAD
            Text("Home")
                .font(.title)
                .tabItem {
                    VStack {
=======
            Home()
            .tabItem {
>>>>>>> 524df9b6bb8d171147461e5171dad85eb5ac7836
                        Image("first")
                }
<<<<<<< HEAD
                .tag(0)
            Text("Live")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
            Text("Search")
            .font(.title)
            .tabItem {
                VStack {
                    Image("Third")
                    Text("Third")
                }
            }
            .tag(2)
            Text("Recommended")
            .font(.title)
            .tabItem {
                VStack {
                    Image("Fourth")
                    Text("Fourth")
                }
            }
            .tag(3)
=======
>>>>>>> 524df9b6bb8d171147461e5171dad85eb5ac7836
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
