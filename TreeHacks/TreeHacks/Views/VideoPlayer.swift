//
//  VideoPlayer.swift
//  TreeHacks
//
//  Created by Sophie Berger on 15.02.20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct VideoPlayer: View {
    var urlString:String
    
    @State var hideVideo = false

    
    var body: some View {
            Webview(url: urlString)
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer(urlString: "https://www.youtube.com/watch?v=HobxLbPhrMc")
    }
}
