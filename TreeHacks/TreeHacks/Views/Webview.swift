//
//  Webview.swift
//  TreeHacks
//
//  Created by Sophie Berger on 15.02.20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    
    var url:String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<Webview>) {
        
    }
    
}
