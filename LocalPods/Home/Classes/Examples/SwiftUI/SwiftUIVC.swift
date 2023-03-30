//
//  SwiftUIVC.swift
//  Home
//
//  Created by zitao0206 on 2022/11/30.
//

import UIKit
import SwiftUI

open class SwiftUIVC: UIViewController {
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let contentView = ContentView()
        
        let hostingController = UIHostingController(rootView: contentView) // 将 Text 控件添加到 UIHostingController 中
        addChild(hostingController) // 添加 UIHostingController 到当前的 UIViewController 中
        view.addSubview(hostingController.view) // 将 UIHostingController 的视图添加到当前的 UIViewController 中
        
        hostingController.didMove(toParent: self)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: -100),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
  
    }
    
}

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Typical Examples of SwiftUI")
                    .font(.title)
                    .foregroundColor(.blue)
                
                Button(action: {
                    print("you tap it just now.")
                }) {
                    Text("this is just a button.")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                NavigationLink(destination: Example00View()) {
                    Text("Example00")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: Example01View()) {
                   Text("Example01")
                       .foregroundColor(.white)
                       .padding()
                       .background(Color.blue)
                       .cornerRadius(10)
                }
                NavigationLink(destination: Example02View()) {
                   Text("Example02")
                       .foregroundColor(.white)
                       .padding()
                       .background(Color.blue)
                       .cornerRadius(10)
                }
                NavigationLink(destination: Example03View()) {
                   Text("Example03")
                       .foregroundColor(.white)
                       .padding()
                       .background(Color.blue)
                       .cornerRadius(10)
                }
            }
            .padding(.top, -200)
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}


struct Example00View: View {
    var body: some View {
        Text("Example00 View")
    }
}

struct Example01View: View {
    var body: some View {
        Text("Example01 View")
    }
}

struct Example02View: View {
    var body: some View {
        Text("Example02 View")
    }
}

struct Example03View: View {
    var body: some View {
        Text("Example03 View")
    }
}
