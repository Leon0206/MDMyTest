//
//  ResultBuilder00.swift
//  Programming
//
//  Created by zitao0206 on 2023/2/23.
//

import Foundation

@resultBuilder
struct StringBuilder {
    static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "")
    }
}

@StringBuilder
func createString() -> String {
    "Hello, " +
    "World!" +
    " Welcome to Swift!"
}

class ResultBuilder00 : CommonOpsProtocol {
    
    func testCase() {
 
        print(createString()) // 输出 "Hello, World! Welcome to Swift!"

    }
}


 

