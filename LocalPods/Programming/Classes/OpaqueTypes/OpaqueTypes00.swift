//
//  TypeErasure00.swift
//  Programming
//
//  Created by lizitao on 2023/2/23.
//

import Foundation

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
       var result: [String] = []
       for length in 1...size {
           result.append(String(repeating: "*", count: length))
       }
       return result.joined(separator: "\n")
    }
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
       return top.draw() + "\n" + bottom.draw()
    }
}

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}


func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}

func flip<T: Shape>(_ shape: T) -> any Shape {
    return FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

//func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
//    if shape is Square {
//        return shape // Error: return types don't match
//    }
//    return FlippedShape(shape: shape) // Error: return types don't match
//}

func protoFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }

    return FlippedShape(shape: shape)
}

class OpaqueTypes00 : CommonOpsProtocol {
    
    func testCase() {
        let smallTriangle = Triangle(size: 3)
//        print(smallTriangle.draw())
//
//        let flippedTriangle = FlippedShape(shape: smallTriangle)
//        print(flippedTriangle.draw())
//
//        let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
//        print(joinedTriangles.draw())
        
//        let middle = Square(size: 2)
//        print(middle.draw())
//
//        let trapezoid = makeTrapezoid()
//        print(trapezoid.draw())
        
        let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
        print(opaqueJoinedTriangles.draw())
      
    }
}
 

