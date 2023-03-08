//
//  Associatedtype00.swift
//  Programming
//
//  Created by lizitao on 2023/3/7.
//

import Foundation

protocol Animal {
    func eat()
}

struct Cat: Animal {
  func eat() {
    print("Eat fish!")
  }
}

struct Panda: Animal {
  func eat() {
    print("Eat bamboo!")
  }
}

struct Farm {
    func genericsFeed<T>(_ animal: T) where T:Animal {
        animal.eat()
    }
    func existentialFeed(_ animal: any Animal) {
        animal.eat()
    }
}

class ExistentialType00 : CommonOpsProtocol {
    
    func testCase() {
        var cat: some Animal = Cat()
//        cat = Cat()
        var copyCat: some Animal = cat
//        copyCat = cat
    }
}
