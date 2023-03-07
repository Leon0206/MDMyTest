//
//  CommonOpsManager.swift
//  Programming
//
//  Created by lizitao on 2023/3/6.
//

import Foundation

final public class CommonOpsManager : CommonOpsProtocol {
    
    public static let manager = CommonOpsManager()
    
    private init() {}
    
    public func testCase() {
        ResultBuilder01().testCase()
        ResultBuilder00().testCase()
//        OpaqueTypes00().testCase()
//        TypeErasure01().testCase()
//        TypeErasure00().testCase()
    }
    
}
