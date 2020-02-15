//
//  VideoPlayer.swift
//  TreeHacks
//
//  Created by Sophie Berger on 15.02.20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI

struct VideoPlayer: View {
    var title:String
    var description: String
    
    @State var hideVideo = false

    
    var body: some View {
            Webview(url: "https://www.google.com/search?q=Using+UIWebView+in+swift+UI+to+play+a+youttube+video&oq=Using+UIWebView+in+swift+UI+to+play+a+youttube+video&aqs=chrome..69i57.11427j1j1&sourceid=chrome&ie=UTF-8#kpvalbx=_WklIXq-IH8bL0PEP1Z-I8Ao23")
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer(title: "Test", description: "Desc")
    }
}
