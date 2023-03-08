//
//  ResultBuilder01.swift
//  Programming
//
//  Created by lizitao on 2023/3/7.
//

import Foundation

#if swift(>=5.4)
@resultBuilder
public struct ArrayResultBuilder<T> {
    
    public static func buildBlock(_ components: [T]...) -> [T] {

        return components.flatMap({ $0 })
    }
    
    public static func buildEither(first: [T]) -> [T] {
        return first
    }
    
    public static func buildEither(second: [T]) -> [T] {
        return second
    }

    public static func buildOptional(_ component: [T]?) -> [T] {
        return component == nil ? [] : component!
    }
    
    public static func buildExpression(_ component: T) -> [T] {
        [component]
    }
    
    public static func buildExpression(_ component: Void) -> [T] {
        []
    }
}
extension ArrayResultBuilder {
    public static func build(@ArrayResultBuilder<T> _ builder: () -> [T]) -> [T] {
        builder()
    }
}
#else

#endif

protocol A {}

struct test00 : A {}

struct test01 : A {}

struct test02 : A {}

@ArrayResultBuilder<A>
func pageFirstObjects() -> [A] {
    test00()
    test01()
}

@ArrayResultBuilder<A>
func pageSecondObjects() -> [A] {
    ()
}

@ArrayResultBuilder<A>
func pageThirdObjects() -> [A] {
    let a: A? = test00()
    if let a = a {
        a
    }
}

func pageFourthObjects(@ArrayResultBuilder<A> _ builder: () -> [A]) -> [A] {
    builder()
}


@ArrayResultBuilder<A>
func PageType(for name: String?) -> [A] {
    if name != nil {
        test00()
        test01()
    } else {
        test01()
        test02()
    }
}

func printSwiftVersion() {
#if swift(>=5.7.0)
print("Swift version: 5.7.2 or newer")
#elseif swift(>=5.7)
print("Swift version: 5.7 or newe")
#elseif swift(>=5.4)
print("Swift version: 5.4 or newe")
#elseif swift(>=5.3)
print("Swift version: 5.3")
#elseif swift(>=5.2)
print("Swift version: 5.2")
#elseif swift(>=5.1)
print("Swift version: 5.1")
#elseif swift(>=5.0)
print("Swift version: 5.0")
#elseif swift(>=4.2)
print("Swift version: 4.2")
#elseif swift(>=4.1)
print("Swift version: 4.1")
#elseif swift(>=4.0)
print("Swift version: 4.0")
#elseif swift(>=3.0)
print("Swift version: 3.0")
#else
print("Unknown Swift version")
#endif

}

class ResultBuilder01 : CommonOpsProtocol {
    
    func testCase() {
//        let res00 = pageFirstObjects()
//        print(res00)
//
//        let res01 = pageSecondObjects()
//        print(res01)
//
//        let res02 = pageThirdObjects()
//        print(res02)
        
        let res03 = pageFourthObjects {
            test00()
            test01()
            test02()
        }
        print(res03)
        
//        let name: String? = "Ravi Patel"
//        let res = PageType(for: name)
//        print(res)
        
        let tvShow: [any Equatable] = ["Brooklyn", 99]
        
        printSwiftVersion()

        
    }
}

 
