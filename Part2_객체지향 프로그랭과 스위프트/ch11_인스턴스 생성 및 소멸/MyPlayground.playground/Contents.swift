import Foundation


class SomeClass {
    init() {
        // 초기화활 때 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case중 하나가 되어야 합니다.
        self = .someCase
    }
}




struct Area {
    var squaerMaster: Double
    
    init(fromPy py: Double) {                   // 첫 번째 이니셜라이저
        squaerMaster = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) { // 두 번째 이니셜라이저
        self.squaerMaster = squareMeter
    }
    
    init(value: Double) {                       // 세 번째 이니셜라이저
        squaerMaster = value
    }
    
    init(_ value: Double) {                     // 네 번째 이니셜라이저
        squaerMaster = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squaerMaster) // 49.587

let roomTwo:Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squaerMaster) // 33.06

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)





//
//class Person {
//    let name: String
//    var age: Int?
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let hoon: Person = Person(name: "hoon")
//print(hoon.name)    // hoon
//print(hoon.age)     // nil
//
//hoon.name = "jong"  // 오류 발생!!!


//struct Point {
//    var x: Double = 0.0
//    var y: Double = 0.0
//}
//
//struct Size {
//    var width: Double = 0.0
//    var height: Double = 0.0
//}
//
//let point: Point = Point(x: 0, y: 0)
//let size: Size = Size(width: 50.0, height: 50.0)
//
//// 구조체의 저장 프로퍼티에 기본값이 있는경우
//// 필요한 매개변수만 사용하여 초기화하 수도 있습니다.
//let somePoint: Point = Point()
//let someSize: Size = Size(width: 50)
//let anotherPoint: Point = Point(y: 100)










//enum Student {
//    case elementary, middle, high
//    case none
//    // 사용자 정의 이니셜라이저가 있는 경우, init() 메서드를 구현해주어야 기본 이니셜라이저를
//    // 사용할 수 있다.
//    init() {
//        self = .none
//    }
//
//    init(koreanAge: Int) {                  // 첫 번째 상용자 정의 이니셜라이저
//        switch koreanAge {
//        case 8...13:
//            self = .elementary
//        case 14...16:
//            self = .middle
//        case 17...19:
//            self = .high
//        default:
//            self = .none
//        }
//    }
//
//    init(bornAt: Int, currentYear: Int) {   // 두 번째 사용자 정의 이니셜라이저
//        self.init(koreanAge: currentYear - bornAt + 1)
//    }
//}
//
//var younger: Student = Student(koreanAge: 16)
//print(younger)      // middle
//
//younger = Student(bornAt: 1998, currentYear: 2016)
//print(younger)      // high





class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}
let yagom: Person? = Person(name: "yagom", age: 99)

if let person: Person = yagom {
    print(person.name)
} else {
    print("Person wasn't initializeㅇ")
}
// yagom

let chope: Person? = Person(name: "chope", age: -10)

if let person: Person = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

// Person wasn't initialized



//
//enum Student: String {
//    case elementary = "초등학생", middle = "중학생", high = "고등학생"
//
//    init?(koreanAge: Int) {
//        switch koreanAge {
//        case 8...13:
//            self = .elementary
//        case 14...16:
//            self = .middle
//        case 17...19:
//            self = .high
//        default:
//            return nil
//        }
//    }
//
//    init?(bornAt: Int, currentYear: Int) {
//        self.init(koreanAge: currentYear - bornAt + 1)
//    }
//}
//
//
//var younger: Student? = Student(koreanAge: 20)
//print(younger)      // nil
//
//younger = Student(bornAt: 2020, currentYear: 2016)
//print(younger)      // nil
//
//younger = Student(rawValue: "대학생")
//print(younger)
//print(younger)      // nil
//younger = Student(rawValue: "고등학생")
//print(younger)      // high
//
//





//class SomeClass {
//    let someProperty: SomeType = {
//        // 새로운 인스턴스를 생성하고 사용자 정의 연살을 통한 후 반환해준다
//        // 반환되는 값의 타입은 SomeType과 같은 타입이어야 한다.
//        return someValue
//    }()
//}


struct Student {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student] = {
        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해준다.
        // 반환되는 값의 타입은 [Student] 타입이어야 한다.
        var arr: [Student] = [Student]()
        
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)   // 15








class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()      // Open File: abc.txt
    manager.modifyFile()    // Modify File: abc.txt
}

fileManager = nil
// Deinit instance
// Write File: abc.txt
// Close File: abc.txt









//private class AClass {
//    // 공개 접근수준을 부여해도 AClass의 접근수준이 비공개 접근수준이므로
//    // 이 메서드의 접근수준도 비공개 접근수준으로 취급된다.
//    public func someMethod() {
//        // ...
//    }
//}
//
//// AClass의 접근수준이 비공개 접근수준이므로
//// 공개 접근수준 함수의 매개변수나 반환 값 타입으로 사용할 수 없습니다.
//public func someFunction(a: AClass) -> AClass { // 오류 발생!
//    return a
//}





//internal class InternalClass {} // 내부 접근수준 클래스
//private struct PrivateStruct {} // 비공개 접근수준 구조체
//
//// 요소로 사용되는 InternalClass와 PrivateStruct의 접근수준이
//// publicTuple보다 낮기 때문에 사용할 수 없다.
//public var publicTuple: (first: InternalClass, second: PrivateStruct) =
//    ( InternalClass(), PrivateStruct() )


//
//private typealias PointValue = Int
//
//// 오류 - PointValue가 Point보다 접근수준이 낮기 때문에 원시 값으로 사용할 수 없다.
//enum Point: PointValue {
//    case x, y
//}








//public struct SomeType {
//    private var priavateVariable = 0
//    fileprivate var fileprivateVariable = 0
//}
//
//// 같은 타입의 익스텐션에는 private요소에 접근 가능
//extension SomeType {
//    public func publicMethod() {
//        print("\(self.priavateVariable), \(self.fileprivateVariable)")
//    }
//
//    private func privateMethod() {
//        print("\(self.priavateVariable), \(self.fileprivateVariable)")
//    }
//
//    fileprivate func fileprivateMethod() {
//        print("\(self.priavateVariable), \(self.fileprivateVariable)")
//    }
//
//}
//
//struct AnotherType {
//    var someInstance: SomeType = SomeType()
//
//    mutating func someMethod() {
//        // public 접근 수준에서는 어디서든 접근 가능
//        self.someInstance.publicMethod()        // 0. 0
//
//        // 같은 파일에 속해 있는 코드이므로 fileprivat 접근수준 요소에 접근 가능
//        self.someInstance.fileprivateVariable = 100
//        self.someInstance.fileprivateMethod()   // 0, 100
//
//        // 다른 타입 내부의 코드이므로 private 요소에 접근 불가! 오류!
//        // self.someInstance.privateVariable = 100
//        // self.someInstance.privateMethod()
//    }
//}
//
//var anotherInstance = AnotherType()
//anotherInstance.someMethod()
//



public struct SomeType {
    // 비공개 접근수준 저장 프로퍼티 count
    private var count: Int = 0
    
    // 공개 접근수준 저장 프로퍼티 publicStoredProperty
    public var publicStoredProperty: Int = 0
    
    // 공개 접근수준 저장 프로퍼티 publicGetOnlyStoredProperty
    // 설정자는 비공개 접근 수준
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
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
print(someInstance.publicGetOnlyStoredProperty)         // 0
// someInstance.publicGetOnlyStoredProperty = 100       // 오류

// 외부에서 접근자, 설정자 모두 사용가능
print(someInstance.internalComputedProperty)            // 0
someInstance.internalComputedProperty = 100

// 외부에서 접근자만 가능
print(someInstance.internalGetOnlyComputedProperty)     // 1
// someInstance.internalGetOnlyComputedProperty = 100   // 오류

// 외부에서 접근자, 걸정자 모두 사용 가능
print(someInstance[0])
someInstance[0] = 100

// 외부에서 접근자만, 같은 모듈내에서는 설정자도 사용 가능
print(someInstance[0])
someInstance[0] = 100
