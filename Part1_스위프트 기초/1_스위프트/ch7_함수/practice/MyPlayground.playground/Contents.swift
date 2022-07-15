//// from과 to라는 전달인자 레이블이 있으며
//// myNmae과 name이라는 매개변수 이름이 있는 sayHello 함수
//func sayHello(from myName: String, to name: String) -> String {
//    return "Hello \(name)! I'm \(myName)"
//}
//
//print(sayHello(from: "yagom", to: "Hoon"))
//// Hello Hoon! I'm yagom
//
//
//func sayHello(to name: String, _ times: Int) -> String {
//    var result: String = ""
//
//    for _ in 0..<times {
//        result += "Hello \(name)!" + " "
//    }
//    return result
//}
//
//func sayHello(to name: String, repaetCount times: Int) -> String {
//    var result: String = ""
//
//    for _ in 0..<times {
//        result += "Hello \(name)!" + " "
//    }
//    return result
//}
//
//print(sayHello(to: "Chope", 2))
//print(sayHello(to: "Chope", repaetCount: 2))
//
//
//func sayHello(_ name: String, times: Int = 3) -> String {
//    var result: String = ""
//
//    for _ in 0..<times {
//        result += "Hello \(name)!" + " "
//    }
//    return result
//}
//
//// times 매개변수의 전달 값을 넘겨주지 않아 기본값 3을 반영
//print(sayHello("hana"))     // Hello hana! Hello hana! Hello hana!
//
//
//// times 매개변수의 전달 값을 2로 넘겨줌
//print(sayHello("hoon", times: 2))   // Hello hoon! Hello hoon!
//
//
//
//
//func sayHelloToFriends(me: String, friends names: String...) -> String {
//    var result: String = ""
//
//    for friend in names {
//        result += "Hello \(friend)!" + " "
//    }
//
//    result += "I'm " + me + "!"
//    return result
//}
//
//print((sayHelloToFriends(me: "Hoon", friends: "A", "B", "C", "D", "E")))
//// Hello A! Hello B! Hello C! Hello D! Hello E! I'm Hoon!
//
//print((sayHelloToFriends(me: "Hoon")))
////I'm Hoon!
//
//
//var numbers: [Int] = [1, 2, 3]
//
//func nonReferenceParameer(_ arr: [Int]) {
//    var copiedArr: [Int] = arr
//    copiedArr[1] = 1
//}
//
//func referenceParameter(_ arr: inout [Int]) {
//    arr[1] = 1
//}
//
//nonReferenceParameer(numbers)
//print(numbers[1])   // 2
//
//referenceParameter(&numbers)    // 참조를 표현하기 위해 &를 붙여줍니다.
//print(numbers[1])   // 1
//
//
//
//func sayHelloWorld() {
//    print("Hello, world!")
//
//}
//sayHelloWorld()     // Hello, world!
//
//func sayGoodbye() -> Void {     // Void를 명시
//    print("Good bye")
//}
//sayGoodbye()    // Good bye
//
//
////MARK: - 1
//
//typealias CalculateTwoInts = (_ lhs: Int, _ rhs: Int) -> Int
//
//func addTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a * b
//}
//
//var mathFunction: CalculateTwoInts = addTwoInts
//
//print(mathFunction(2 ,5))   // 2 + 5 = 7
//
//mathFunction = multiplyTwoInts(_:_:)
//print(mathFunction(2, 5))   // 2 * 5 = 10
//
//
//func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
//    print("Result: \(mathFunction(a, b))")
//}
//
//printMathResult(addTwoInts, 3, 5)   // Result: 8
//
//
//func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
//    return toAdd ? addTwoInts : multiplyTwoInts
//}
//
//printMathResult(chooseMathFunction(true), 3, 5 )    // Result: 8
//
//
//"""
//| -3 | -2 | -1 | 0 | 1 | 2 | 3 |
//특정 위치에서 원점으로 이동하는 함수
//"""
//
//typealias MoveFunc = (Int) -> Int
//
//func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
//    func goRight(_ currentPosition: Int) -> Int {
//        return currentPosition + 1
//    }
//
//    func goLeft(_ currentPosition: Int) -> Int {
//        return currentPosition - 1
//    }
//
//    return shouldGoLeft ? goLeft : goRight
//}
//
//var position: Int = -4
//
//let moveToZero: MoveFunc = functionForMove(position > 0)
//
//// 원점에 도착하면 종료
//while position != 0 {
//    print("\(position)...")
//    position = moveToZero(position)
//}
//
//print("원점 도착!")
//
//

//MARK: - 비반환 함수

//func crashAndBurn() -> Never {
//    fatalError("Something very, very bad happened")
//}
//
//crashAndBurn()  // 프로세스를 종료 후 오류 보고
//
//func someFunction(isAllIsWell: Bool) {
//    guard isAllIsWell else {
//        print("마을에 도둑이 들었습니다!")
//        crashAndBurn()
//    }
//    print("All is well")
//}
//
//someFunction(isAllIsWell: true)     // All is well
//someFunction(isAllIsWell: false)    // 마을에 도둑이 들었습니다!
//// 프로세스 종료 후 오류 보고


//MARK: - 반환 값을 무시

func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discadableResultSay(_ something: String) -> String {
    print(something)
    return something
}

// 반환 값을 사용하지 않으므로 컴파일러가 경고를 표시할 수 있다.
say("hello")    // hello

// 반환 값을 사용하지 않아도 컴파일러가 경고하지 않는다.
discadableResultSay("hello")    // hello


typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("hoon", 21)

switch tupleValue {
    case ("hoon", 24):
        print("정확히 맞췄습니다!")
    case ("hoon", _):
        print("이름만 맞았습니다. 나이는 \(tupleValue.age)입니다")
    case(_, 24):
        print("나이만 맞았습니다. 이름은 \(tupleValue.name)입니다.")
    default:
        print("누굴 찾나요?")
}
