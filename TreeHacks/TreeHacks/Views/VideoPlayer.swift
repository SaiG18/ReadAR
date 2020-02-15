//
//  VideoPlayer.swift
//  TreeHacks
//
//  Created by Sophie Berger on 15.02.20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoPlayer: View {
    var title:String
    var description: String
    
    @State var hideVideo = false

    
    var body: some View {
        VStack{
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(nil)
            player().frame(height: UIScreen.main.bounds.height / 3)
            Spacer()
            Text(description)
                .font(.system(.body))
            Spacer()
        }
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayer(title: "Test", description: "Desc")
    }
}

struct player: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        let url = "https://www.youtube.com/watch?v=lSCztqwZrYo"
        let player1 = AVPlayer(url: URL(string: url)!)
        controller.player = player1
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
        
    }
}
