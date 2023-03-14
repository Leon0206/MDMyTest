//
//  PhantomTypes00.swift
//  Programming
//
//  Created by lizitao on 2023/2/23.
//

import Foundation
enum OPositive { }
enum APositive { }
enum BPositive { }

struct BloodSample<T> {
    let amount: Double

    static func +(lhs: BloodSample, rhs: BloodSample) -> BloodSample {
        BloodSample(amount: lhs.amount + rhs.amount)
    }
}

class PhantomTypes00 : CommonOpsProtocol {
    
    func testCase() {
 
        let sample1 = BloodSample<OPositive>(amount: 5)
        let sample2 = BloodSample<APositive>(amount: 5)
        let sample3 = BloodSample<OPositive>(amount: 7)

        //this code will work:
//        let combined1 = sample1 + sample3
        //But this will not:
//        let combined2 = sample1 + sample2
        
    }
}
 

