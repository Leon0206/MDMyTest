//
//  PhantomTypes01.swift
//  Programming
//
//  Created by zitao0206 on 2023/3/9.
//

import Foundation

struct User00 {
    let id: Int
    let age: Int
}
let user00 = User00(id: 53, age: 53)


enum UserID { }
enum Age { }

struct Tag<Type>: Equatable {
    var value: Int
}

//struct Tag<Type>: Equatable, ExpressibleByIntegerLiteral {
//    init(integerLiteral value: Int) {
//        self.value = value
//    }
//
//    var value: Int
//}

struct User01 {
    let id: Tag<UserID>
    let age: Tag<Age>

    init(id: Int, age: Int) {
        self.id = Tag(value: id)
        self.age = Tag(value: age)
    }
}


let user01 = User01(id: 53, age: 53)

class PhantomTypes01 : CommonOpsProtocol {
    
    func testCase() {
        //this code will work:
        print(user00.id == user00.age)
        //this code will not work:
//        print(user01.id == user01.age)
    }
}
