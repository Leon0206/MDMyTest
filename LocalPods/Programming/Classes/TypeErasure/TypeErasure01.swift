//
//  TypeErasure01.swift
//  Programming
//
//  Created by zitao0206 on 2023/3/6.
//

import Foundation
/*
    Type Erasure应用之二：AnySequence的实现
 */

// 定义 Sequence操作的真实实现
private struct RealCusomSequence<Element>: Sequence {
    private let _makeIterator: () -> AnyIterator<Element>
    
    init<S: Sequence>(_ sequence: S) where S.Element == Element {
        _makeIterator = { AnyIterator(sequence.makeIterator()) }
    }
    
    public func makeIterator() -> AnyIterator<Element> {
        _makeIterator()
    }
    
    public func customContains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        // 获取 AnySequence 内部的迭代器
        let iterator = _makeIterator()
        // 遍历序列元素，如果有满足条件的就返回 true
        while let element = iterator.next() {
            if try predicate(element) {
                return true
            }
        }
        // 如果遍历完了还没有找到满足条件的元素，则返回 false
        return false
    }
}

public struct AnyCusomSequence<Element>: Sequence where Element: Equatable {
    
    private let box: BoxBase<Element>

    public init<S: Sequence>(_ base: S) where S.Element == Element {
        if let anySequence = base as? AnyCusomSequence<Element> {
            self = anySequence
        } else {
            self.box = Box(base)
        }
    }
    
    private class BoxBase<Element>: Sequence {
        
        func makeIterator() -> AnyIterator<Element> {
            fatalError("Abstract method")
        }
        
        func customContains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
            fatalError("Abstract method")
        }
    }

    private final class Box<Concrete: Sequence>: BoxBase<Element> where Concrete.Element == Element {
        let concrete: Concrete

        init(_ concrete: Concrete) {
            self.concrete = concrete
        }

        override func makeIterator() -> AnyIterator<Element> {
            return AnyIterator(concrete.makeIterator())
        }
        override func customContains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
            return false
        }
    }

    public func makeIterator() -> AnyIterator<Element> {
        return box.makeIterator()
    }
    
    public func customContains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        return false
    }

    
}

class TypeErasure01 : CommonOpsProtocol {
    
    func testCase() {
        let arr: [Int] = [1, 2, 3, 4, 5]
        let anySeq = AnyCusomSequence(arr)
        for item in anySeq {
            print(item)
        }
 
        let res = anySeq.customContains { e in
            e < 2
        }
        print(res)
        
//        let a = anySeq.contains { obj in
//            obj < 2
//        }
//        print(a)

      
    }
}
 
