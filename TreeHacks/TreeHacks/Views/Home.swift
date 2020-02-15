//
//  Home.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/15/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        Button(action: {
            print("setings")
        }) {
                Text("Settings")
                    .position(x: 330, y: 10)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
