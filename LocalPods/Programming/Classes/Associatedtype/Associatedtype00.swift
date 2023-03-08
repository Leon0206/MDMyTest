//
//  Associatedtype00.swift
//  Programming
//
//  Created by lizitao on 2023/3/7.
//

import Foundation
/* Associated Type */
protocol MySequence00 {
    associatedtype Element
    var storage: [Element] { get set }
}

func are<S: MySequence00>(_ s1: S, lessThan s2: S) -> Bool {
    // 返回 true / false
    return true
}
 

/* 用 Comparable 来实现 */
protocol MySequence01: Comparable {
    associatedtype Element
    var storage: [Element] { get set }
}

extension MySequence01 {
    static func < (lhs: Self, rhs: Self) -> Bool {
        return true
    }
}

/* Associated Type 是可以约束 */
protocol MySequence02: Comparable {
    associatedtype Element: Comparable
    var storage: [Element] { get set }
}

extension MySequence02 {
    static func < (lhs: Self, rhs: Self) -> Bool {
        for (left, right) in zip(lhs.storage, rhs.storage) {
            if left < right {
                return true
            }
        }
        return false
    }
}

/* where 从句实现更复杂的约束 */
 protocol MySequence03: Comparable {
     associatedtype Element: Comparable
     associatedtype Slice: MySequence03 where Slice.Element == Element
     var storage: [Element] { get set }
 }

/*提供 Element 的默认类型  */
protocol MySequence04: Comparable {
    associatedtype Element: Comparable = Int
    var storage: [Element] { get set }
}
struct IntegerSequence: MySequence04 {
    static func < (lhs: IntegerSequence, rhs: IntegerSequence) -> Bool {
        return false
    }
    var storage: [Element]
}
//依然可以搞 Int 之外的类型的 MySequence
struct StringSequence: MySequence04 {
    static func < (lhs: StringSequence, rhs: StringSequence) -> Bool {
        false
    }
    var storage: [String]
}

/*
 为默认的 Associated Type 提供方法的默认实现
 */
protocol MySequence05: Comparable {
    associatedtype Element: Comparable = Int
    var storage: [Element] { get set }

    func summed() -> Element
}
// ❌
//因为 extension 中的 Element 只受“约束”的影响，即只受 : Comparable 和 where 从句的影响，并不接受默认值
//extension MySequence05 {
//    func summed() -> Element {
//        return storage.reduce(0, +)
//    }
//}

//那么怎么提供 Element 为 Int 的默认 summed() 实现呢？用 where 约束 extension 即可：
extension MySequence05 where Element == Int {
    func summed() -> Element {
        return storage.reduce(0, +)
    }
}

//如果 Element 为其他类型的，需要自己实现 summed()：
struct StringSequence05: MySequence05 {
    static func < (lhs: StringSequence05, rhs: StringSequence05) -> Bool {
        return false
    }
    
    var storage: [String]

    func summed() -> String {
        return storage.reduce("", +)
    }
}


/*
 比较大小的方法：
 */
protocol MySequence06: Comparable {
    associatedtype Element
    var storage: [Element] { get set }
}


extension MySequence06 {
    static func < (lhs: Self, rhs: Self) -> Bool {
        return true
    }
}
// ❌ 两个不同类型的对象比较，是无法通过编译的：
func are<S: MySequence06>(_ s1: S, lessThan s2: S) -> Bool {
    // 返回 true / false
    return true
}

struct IntegerSequence06: MySequence06 {
    var storage: [Int]
}

struct StringSequence06: MySequence06 {
    var storage: [String]
}

//假如你要比较两种类型的话，就需要这样实现：
func are<S1: MySequence06, S2: MySequence06>(_ s1: S1, lessThan s2: S2) -> Bool {
    return true
}

extension MySequence06 {
    static func < <S2: MySequence06>(lhs: Self, rhs: S2) -> Bool {
        // return true / false
        return true
    }
}

class Associatedtype00 : CommonOpsProtocol {
    
    
    func testCase() {
        var integerSequence = IntegerSequence(storage: [])
        // Xcode 可以推断出 storage 是 Int 数组：
        integerSequence.storage.append(1)
        

        let integerSequence06 = IntegerSequence06(storage: [0, 1])
        let stringSequence06 = StringSequence06(storage: ["0", "1"])
        let _ = are(integerSequence06, lessThan: stringSequence06)
    }
}
