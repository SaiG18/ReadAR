//
//  RealTime.swift
//  TreeHacks
//
//  Created by Sai Gurrapu on 2/15/20.
//  Copyright © 2020 Sai Gurrapu. All rights reserved.
//

import SwiftUI
import ARKit
import SceneKit

struct RealTime: View {
    var body: some View {
        ViewControllerWrapper()
    }
}

struct RealTime_Previews: PreviewProvider {
    static var previews: some View {
        RealTime()
    }
}

struct ViewControllerWrapper: UIViewControllerRepresentable {
 
    typealias UIViewControllerType = ViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        //
    }
}


