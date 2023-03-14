//
//  Actor01.swift
//  Programming
//
//  Created by lizitao on 2023/3/13.
//

import Foundation

actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

class User {
  var name: String
  var age: Int

  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

actor BankAccount {
    let accountNumber: Int
    var balance: Double
    var name: String
    var age: Int
    init(accountNumber: Int, initialDeposit: Double, name: String, age: Int) {
        self.accountNumber = accountNumber
        self.balance = initialDeposit
        self.name = name
        self.age = age
    }
    func user() -> User {
        return User.init(name: name, age: age)
    }
}

class AccountManager {
    let bankAccount = BankAccount.init(accountNumber: 123, initialDeposit: 1000, name: "Jike", age: 18)

    func user() async -> User {
    // Wraning: Non-sendable type 'User' returned by implicitly asynchronous call to actor-isolated instance method 'user()' cannot cross actor boundary
    return await bankAccount.user()
    }
}

class Actor01 : CommonOpsProtocol {
    func testCase() {
        
    }
    
}
