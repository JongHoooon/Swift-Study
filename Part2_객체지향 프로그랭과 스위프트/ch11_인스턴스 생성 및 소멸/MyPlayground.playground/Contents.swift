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


struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

// 구조체의 저장 프로퍼티에 기본값이 있는경우
// 필요한 매개변수만 사용하여 초기화하 수도 있습니다.
let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)










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
