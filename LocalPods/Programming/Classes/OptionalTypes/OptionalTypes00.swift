//
//  OptionalTypes00.swift
//  Programming
//
//  Created by lizitao on 2023/2/23.
//

import Foundation

//struct User1 {
//    var friend: User1
//}

struct User2 {
    var friends: [User2]
}

//struct User3 {
//    var friend: User3?
//}

final class Box<T> {
    var value: T

    init(value: T) {
        self.value = value
    }
}

struct User4 {
    var friend: Box<User4>?
}

indirect enum CustomOptional<Wrapped> {
    case none
    case some(Wrapped)
}

struct User5 {
    var friend: CustomOptional<User5>
}

class OptionalTypes00 : CommonOpsProtocol {
    
    func testCase() {
 
    }
}
 

