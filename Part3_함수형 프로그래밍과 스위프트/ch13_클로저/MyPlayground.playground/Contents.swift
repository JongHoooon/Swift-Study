import Foundation
import os

/*
public func sorted(by areInIncreasingOrder: (Element, Element -> Bool) -> [Element]
*/


//// 정렬을 위한 함수 전달
//func backwards(first: String, second: String) -> Bool {
//    print("\(first) \(second) 비교중")
//    return first > second
//}
//let reversed: [String] = names.sorted(by: backwards)
//print(reversed)
//
//// backward(frist:second:) 함수 대신에 sorted 메서드의 전달인자로 클로저를 직접 전달한다
//let reversed2: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
//    return first > second
//})
//print(reversed)

//
//let names: [String] = ["wizplan", "erice", "yagom", "jenny"]
//
//// 후행 클로저의 사용
//let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
//    return first > second
//}
//
//// 다중 후행 클로저 사용
//doSomething { (someString: String) in
//    // do closure
//} onSuccess: { (result: Any) in
//    // success closure
//} onFailure: { (error: Error) in
//    // failure closure
//}

//let names: [String] = ["wizplan", "erice", "yagom", "jenny"]
//
//
//let reversed: [String] = names.sorted { (first, second) in
//    return first > second
//}
//
//let reversed2: [String] = names.sorted(by: >)
//
//


func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
//let incrementByTwo2: (() -> Int) = makeIncrementer(forIncrement: 2)
//let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)
//
//let first: Int = incrementByTwo()       // 2
//let second: Int = incrementByTwo()      // 4
//let third: Int = incrementByTwo()       // 6
//
//let first2: Int = incrementByTwo2()     // 2
//let second2: Int = incrementByTwo2()    // 4
//let third2: Int = incrementByTwo2()     // 6
//
//let ten: Int = incrementByTen()         // 10
//let twenty: Int = incrementByTen()      // 20
//let thirty: Int = incrementByTen()      // 30


//let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
//let sameWithIncrementByTwo: (() -> Int) = incrementByTwo
//
//let first: Int = incrementByTwo()           // 2
//let second: Int = sameWithIncrementByTwo()  // 4


//var completionHandlers: [() -> Void] = []
//
//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
//}


//let firstClosure: VoidVoidClosure = {
//    print("Closure A")
//}
//let secondClosure: VoidVoidClosure = {
//    print("Closure B")
//}
//
//// first와 second 매개변수 클로저는 함수의 반환 값으로 사용될 수 있으므로 탈출 클로저이다.
//func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
//    // 전달인자로 전달받은 클로저를 함수 외부로 다시 반환하기 때문에 함수를 탈출하는 클로저이다.
//    return shouldReturnFirstClosure ? first : second
//}
//
//// 함수에서 반환한 클로저가 함수 외부의 상수에 저장되었습니다.
//let returnedClosure: VoidVoidClosure = returnOneClosure(
//    first: firstClosure,
//    second: secondClosure,
//    shouldReturnFirstClosure: true
//)
//
//returnedClosure()   // Closure A
//
//var closures: [VoidVoidClosure] = []
//
//// closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저이다.
//func appendClosure(closure: @escaping VoidVoidClosure) {
//    // 전달인자로 전달받은 클로저가 함수 외부의 변수 내부에 저장되므로 함수를 탈출한다.
//    closures.append(closure)
//}


typealias VoidVoidClosure = () -> Void
func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscapingClosure(
    completionHandler: @escaping VoidVoidClosure
    ) -> VoidVoidClosure {
    
    return completionHandler
    }

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        // 비탈출 클로저에서 self 키워드 사용은 선택 사항
        functionWithNoescapeClosure { x = 200 }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        // 탈출 클로저에서는 명시적으로 self를 사용해야 합니다.
        return functionWithEscapingClosure { self.x = 100 }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)   // 200

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)   // 100




//
//func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
//    return (array.lazy.filter { predicate($0) }.isEmpty == false)
//}


let numbers: [Int] = [2, 4, 6, 8]

let evenNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 1
}

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)    // true
print(hasOddNumber)     // false







//
//// 대기 중인 손님들입니다.
//var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
//print(customersInLine.count)    // 4
//
//// 클로저를 만들어 두면 클로저 내부의 코드를 미리 실행(연산) 하지 않고 가지고만 있습니다.
//let customerProvider: () -> String = {
//    return customersInLine.removeFirst()
//}
//print(customersInLine.count)    // 4
//
//// 실제로 실행
//print("Now serving \(customerProvider())!")     // "Now serving YoangWha!"
//print(customersInLine.count)    // 3


//
//var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
//
//func serveCustomer(_ customerProvider: () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//
//serveCustomer( { customersInLine.removeFirst() })


//var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
//
//func serveCustomer(_ customerProvider: @autoclosure () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//
//serveCustomer(customersInLine.removeFirst())    // Now serving YoangWha!


var customersInLine: [String] = ["minjae", "innoveive", "sopress"]

func returnProvider(_ customerProvider: @autoclosure @escaping () ->
    String) -> (() -> String) {
    return customerProvider
}
let customerProvider: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider())!")     // Now serving minjae!




public struct SomeType {
    // 비공개 접근수준 저장 프로퍼티 count
    private var count: Int = 0
    
    // 공개 접근수준 저장 프로퍼티 publicStroedProperty
    public var publicStoredProperty: Int = 0
    
    // 공개 접근수준 저장 프로퍼티 publicGetOnlyStoredProperty
    // 설정자는 비공개 접근수준
    public private(set) var publicGetOnlySotredProperty: Int = 0
    
    // 내부 접근수준 저장 프로퍼티 internalComputedProperty
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 내부 접근수준 저장 프로퍼티 internalGetOnlyComputedProperty
    // 설정자는 비공개 접근수준
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브크립트
    public subscript() -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브스크립트
    // 설정자는 내부 접근수준
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
}

var someInstance: SomeType = SomeType()

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.publicStoredProperty)                // 0
someInstance.publicStoredProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.publicGetOnlySotredProperty)         // 0

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.internalComputedProperty)            // 0
someInstance.internalComputedProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.internalGetOnlyComputedProperty)     // 1
// someInstance.internalGetOnlyComputedProperty = 100   // 오류 발생

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance[])                                   // 1
someInstance[] = 100

// 외부에서 접근자만, 같은 모듈 내에서는 설정자도 사용가능
print(someInstance[0])                                  // 2
someInstance[0] = 100
