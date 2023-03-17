//
//  CommonOpsManager.swift
//  Programming
//
//  Created by zitao0206 on 2023/3/6.
//

import Foundation

final public class CommonOpsManager : CommonOpsProtocol {
    
    public static let manager = CommonOpsManager()
    
    private init() {}
    
    public func testCase() {
        
        Actor01().testCase()
//        AsyncAwait00().testCase()
        
//        OptionalTypes00().testCase()
//        PhantomTypes01().testCase()
//        PhantomTypes00().testCase()
//        ExistentialType00().testCase()
//        Associatedtype00().testCase()
//        ResultBuilder01().testCase()
//        ResultBuilder00().testCase()
//        OpaqueTypes00().testCase()
//        TypeErasure01().testCase()
//        TypeErasure00().testCase()
    }
    
}
