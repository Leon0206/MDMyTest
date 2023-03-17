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
        
//        let label = Text("Hello, World!") // 创建一个 SwiftUI 的 Text 控件
//                  .font(.largeTitle) // 设置字体大小
//                  .foregroundColor(.red)
//        
//        let button = Button(action: {
//            print("Button clicked!")
//        }, label: {
//            Text("Click me!")
//        })
        
        
        hostingController.didMove(toParent: self)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World!")
                .font(.title)
                .foregroundColor(.blue)
            
            Button(action: {
                print("Button tapped")
            }) {
                Text("Tap me!")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}
