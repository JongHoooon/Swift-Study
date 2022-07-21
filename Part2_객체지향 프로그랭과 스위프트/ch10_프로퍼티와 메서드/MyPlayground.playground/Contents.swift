import Foundation


//MARK: - 저장프로퍼티

//// 좌표
//struct CoordinatePoint {
//    var x: Int = 0      // 저장 프로퍼티
//    var y: Int = 0      // 저장 프로퍼티
//}
//
//// 프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없다.
//let hoonPoint: CoordinatePoint = CoordinatePoint()
//
//// 이니셜라이저도 사용 가능
//let wizplanPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
//
//print("hoon's Point : \(hoonPoint.x), \(hoonPoint.y)")
//
//// 사람의 위치 정보
//class Position {
//    var point: CoordinatePoint = CoordinatePoint()  // 저장
//    var name:  String = "Unknown"
//}
//
//// 초깃값을 지정해줬다면 사용자 정의 이니셜라이저를 사용하지 않아도 됩니다.
//let hoonPosition: Position = Position()
//
//hoonPosition.point = hoonPoint
//hoonPosition.name = "hoon"



//// 좌표
//struct CoordinatePoint {
//    // 위치는 x, y 값이 모두 있어야 하므로 욥셔널이면 안 됩니다.
//    var x: Int = 0
//    var y: Int = 0
//}
//
//
//
//// 사람의 위치 정보
//class Position {
//    // 현재 사람의 위치를 모를 수도 있다. - 옵셔널
//    var point: CoordinatePoint?
//    let name:  String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//// 이름은 필수지만 위치는 몰를 수 있습니다.
//let hoonPosition: Position = Position(name: "hoon")
//
//// 위치를 알게되면 그 떄 위치 값을 할당해준다.
//hoonPosition.point = CoordinatePoint(x: 20, y: 10)



//// 좌표
//struct CoordinatePoint {
//    // 위치는 x, y 값이 모두 있어야 하므로 욥셔널이면 안 됩니다.
//    var x: Int = 0
//    var y: Int = 0
//}
//
//// 사람의 위치 정보
//class Position {
//    // 현재 사람의 위치를 모를 수도 있다. - 옵셔널
//    lazy var point: CoordinatePoint = CoordinatePoint()
//    let name:  String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let hoonPosition: Position = Position(name: "hoon")
//
//// 이 코드를 통해 point 프로퍼티로 처음 접근할 때
//// point 프로퍼티의 CoordinatePoint가 생성됩니다.
//print(hoonPosition.point)   // CoordinatePoint(x: 0, y: 0)


//MARK: - 연산 프로퍼티

//struct CoordinatePoint {
//    var x: Int      // 저장 프로퍼티
//    var y: Int      // 저장 프로퍼티
//
//    // 대칭점을 구하는 매서드 - 접근자
//    // Self는 타입 자기 자신을 뜻합니다
//    // Self 대신 CoordinatePoint를 사용해도 됩니다.
//    func oppositePorint() -> Self {
//        return CoordinatePoint(x: -x, y: -y)
//    }
//
//    // 대칭점을 설정하는 메서드 - 설정자
//    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
//        x = -opposite.x
//        y = -opposite.y
//    }
//}
//
//var hoonPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
//
//// 현재 좌표
//print(hoonPosition)                         // CoordinatePoint(x: 10, y: 20)
//
//
//// 대칭 좌표
//print(hoonPosition.oppositePorint())        // CoordinatePoint(x: -10, y: -20)
//
//
//// 대칭 좌표를 (15, 10)으로 설정
//hoonPosition.setOppositePoint(CoordinatePoint(x: 15, y: 10))
//
//// 현재 좌표
//print(hoonPosition)                         // CoordinatePoint(x: -15, y: -10)



//struct CoordinatePoint {
//    var x: Int      // 저장 프로퍼티
//    var y: Int      // 저장 프로퍼티
//
//    // 대칭 좌표
//    var oppositePoint: CoordinatePoint{     // 연산 프로퍼티
//        // 접근자
//        get {
//            CoordinatePoint(x: -x, y: -y)
//        }
//
//        // 설정자
//        set {
//            x = -newValue.x
//            y = -newValue.y
//        }
//    }
//}
//
//var hoonPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
//
//// 현재 좌표
//print(hoonPosition)                     // CoordinatePoint(x: 10, y: 20)
//
//// 대칭좌표
//print(hoonPosition.oppositePoint)       // CoordinatePoint(x: -10, y: -20)



struct CoordinatePoint {
    var x: Int      // 저장 프로퍼티
    var y: Int      // 저장 프로퍼티

    // 대칭 좌표
    var oppositePoint: CoordinatePoint{     // 연산 프로퍼티
        // 접근자
        get {
            CoordinatePoint(x: -x, y: -y)
        }
    }
}

var hoonPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

// 현재 좌표
print(hoonPosition)                     // CoordinatePoint(x: 10, y: 20)

// 대칭좌표
print(hoonPosition.oppositePoint)       // CoordinatePoint(x: -10, y: -20)

// 설정자를 구현하지 않았으므로 오류!!
//hoonPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)


//MARK: - 프로퍼티 감시자

//class Account {
//    var credit: Int = 0 {
//        willSet {
//            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
//        }
//
//        didSet {
//            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
//        }
//    }
//
//    var dollarValue: Double {   // 연산 프로퍼티
//        get {
//            return Double(credit) / 1000.0
//        }
//        set {
//            credit = Int(newValue * 1000)
//            print("잔액을 \(newValue)달러로 변경 중입니다.")
//        }
//    }
//}
//
//class ForeignAccount: Account {
//    override var dollarValue: Double {
//        willSet {
//            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
//        }
//
//        didSet {
//            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
//        }
//    }
//}
//
//
//let myAccount: ForeignAccount = ForeignAccount()
//// 잔액이 0원에서 1000원으로 변경될 예정입니다.
//
//myAccount.credit = 1000
//// 잔액이 0원에서 1000원으로 변경되었습니다.
//
//// 잔액이 1.0달러에서 2.0달러로 변경될 예정입니다.
//// 잔액이 1000원에서 2000원으로 변경될 예정입니다.
//// 잔액이 1000원에서 2000원으로 변경 되었습니다.
//
//myAccount.dollarValue = 2   // 잔액을 2.0달러로 변경 중입니다.
//// 잔액이 1.0달러에서 2.0달러로 변경되었습니다.


//MARK: - 지역 전역 변수

var wonInPocket: Int = 2000 {
    willSet {
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    
    didSet {
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double {
    get {
        return Double(wonInPocket) / 1000.0
    }
    
    set {
        wonInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}


// 주머니의 돈이 2000원에서 3500원으로 변경될 예정입니다.
// 주머니의 돈이 2000원에서 3500원으로 변경되었습니다.
dollarInPocket = 3.5    // 주머니의 달러를 3.5달러로 변경 중입니다.


//MARK: - 타입 프로퍼티와 인스턴스 프로퍼티

//class AClass {
//
//    // 저장 타입 프로퍼티
//    static var typeProperty: Int = 0
//
//    // 저장 인스턴스 프로퍼티
//    var instanceProperty: Int = 0 {
//        didSet {
//            // Self.typeProperty는
//            // AClass.typeProperty와 같은 표현입니다.
//            Self.typeProperty = instanceProperty + 100
//        }
//    }
//
//    // 연산 타입 프로퍼티
//    static var typeComputedProperty: Int {
//        get {
//            return typeProperty
//        } set {
//            typeProperty = newValue
//        }
//    }
//}
//
//AClass.typeProperty = 123
//
//let classInstance: AClass = AClass()
//classInstance.instanceProperty = 100
//
//print(AClass.typeProperty)          // 200
//print(AClass.typeComputedProperty)  // 200





class Account {
    
    static let dollarExchangeRate: Double = 1000.0      // 타입 상수
    
    var credit: Int = 0         // 저장 인스턴스 프로퍼티
    
    var dollarValue: Double {   // 연산 인스턴스 프로퍼티
        get {
            return Double(credit)
        }
        
        set {
            credit = Int(newValue * Account.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}


//MARK: - 키 경로

func someFunction(paramA: Any, paramB: Any) {
    print("someFunction called...")
}

func anotherFunction(paramA: Any, paramB: Any) {
    print("anotherFunction called...")
}

var functionReference = someFunction(paramA:paramB:)

functionReference("A", "B")
functionReference = anotherFunction(paramA:paramB:)







//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Stuff {
//    var name: String
//    var owner: Person
//}
//
//let yagom = Person(name: "yagom")
//let hana = Person(name: "hana")
//let macbook = Stuff(name: "MacBook Pro", owner: yagom)
//var iMac = Stuff(name: "iMac", owner: yagom)
//let iPhone = Stuff(name: "iPhone", owner: hana)
//
//let stuffNameKeyPath = \Stuff.name
//let ownerkeyPath = \Stuff.owner
//
//// \Stuff.owner.name와 같은 표현이다
//let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)
//
//// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 가져온다
//print(macbook[keyPath: stuffNameKeyPath])
//print(iMac[keyPath: stuffNameKeyPath])
//print(iPhone[keyPath: stuffNameKeyPath])
//
//print(macbook[keyPath: ownerNameKeyPath])
//print(iMac[keyPath: ownerNameKeyPath])
//print(iPhone[keyPath: ownerNameKeyPath])
//
//// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 변경한다.
//iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
//iMac[keyPath: ownerkeyPath] = hana
//
//print(iMac[keyPath: stuffNameKeyPath])
//print(iMac[keyPath: ownerNameKeyPath])

// 상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키 경로 서브스크립트로도 값을 바꿔줄 수 없다.
// macbook[keyPath: stuffNameKeyPath] = "macbook pro touch bar"    // 오류 발생!
// yagom[keyPath: \Person.name] = "bear"                           // 오류 발생!



struct Person {
    let name: String
    let nickname:  String?
    let age: Int
    
    var isAdult: Bool {
        return age > 18
    }
}

let yagom: Person = Person(name: "yagom", nickname: "bear", age: 100)
let hana: Person = Person(name: "hana", nickname: "na", age: 100)
let happy: Person = Person(name: "happy", nickname: nil, age: 3)

let family: [Person] = [yagom, hana, happy]
let names: [String] = family.map(\.name)    // ["yagom", "hana", "happy"]
let nicknames: [String] = family.compactMap(\.nickname)     // ["bear", "na"]
let adults: [String] = family.filter(\.isAdult).map(\.name) // ["yagom", "hana"]


//MARK: - 메서드

//class LevelClass {
//    // 현재 레벨을 저장하는 저장 프로퍼티
//    var level: Int = 0 {
//        // 프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
//        didSet {
//            print("Level \(level)")
//        }
//    }
//
//    // 레벨이 올랐을 떄 호출할 메서드
//    func levelUp() {
//        print("Level Up!")
//        level += 1
//    }
//
//    // 레벨이 감소했을 때 호출할 메서드
//    func levelDown() {
//        print("Level Down")
//        level -= 1
//        if level < 0 {
//            reset()
//        }
//    }
//
//    // 특정 레벨로 이동할 때 호출할 메서드
//    func jumpLevel(to: Int) {
//        print("Jump to \(to)")
//        level = to
//    }
//
//    // 레벨을 초기화할 때 호출할 메서드
//    func reset() {
//        print("Reset")
//        level = 0
//    }
//}
//
//var levelCalssInstance: LevelClass = LevelClass()
//levelCalssInstance.levelUp()
//// Level 1
//levelCalssInstance.levelDown()
//// Level 0
//levelCalssInstance.levelDown()
//// Level -1
//// Reset
//// Level 0
//levelCalssInstance.jumpLevel(to: 3)
//// Level 3
//
//
//
//struct LevelStruct {
//    var level: Int = 0 {
//        didSet {
//            print("Level \(level)")
//        }
//    }
//
//    mutating func levelUp() {
//        print("Level Up!")
//        level += 1
//    }
//
//
//    mutating func levelDown() {
//        print("Level Down")
//        level -= 1
//        if level < 0 {
//            reset()
//        }
//    }
//
//
//    mutating func jumpLevel(to: Int) {
//        print("Jump to \(to)")
//        level = to
//    }
//
//
//    mutating func reset() {
//        print("Reset")
//        level = 0
//    }
//}
//
//var levelStructInstance: LevelClass = LevelClass()
//levelStructInstance.levelUp()
//// Level 1
//levelStructInstance.levelDown()
//// Level 0
//levelStructInstance.levelDown()
//// Level -1
//// Reset
//// Level 0
//levelStructInstance.jumpLevel(to: 3)
//// Level 3
//
//


class LevelClass {
    var level: Int = 0
    
    func reset() {
        // 오류! self 프로퍼티 참조 변경 불가능!
//       self = LevelClass()
    }
}

struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()           // Level Up!
print(levelStructInstance.level)        // 1

levelStructInstance.reset()             // Reset!
print(levelStructInstance.level)        // 0

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)   // on


struct Puppy {
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    
    func callAsFunction(destination: String) {
        print("\(destination)(으)로 달려갑니다")
    }
    
    func callAsFunction(something: String, times: Int) {
        print("\(something)(을)를 \(times)번 반복합니다")
    }
    
    func callAsFunction(color: String) -> String {
        return "\(color) 응가"
    }
    
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var doggy: Puppy = Puppy()
doggy.callAsFunction()  // 멍멍
doggy()                 // 멍멍

doggy.callAsFunction(destination: "집")  // 집(으)로 달려갑니다
doggy(destination: "뒷동산")              // 뒷동산(으)로 달려갑니다
doggy(something: "재주넘기", times: 3)     // 재주넘기(을)를 3번 반복합니다
doggy(color: "무지개색")                   // 무지개색 응가
doggy(name: "댕댕이")
print(doggy.name)   // 댕댕이


class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {
    /*
     // 오류 발생!! 재정의 불가!
     override static func staticTypeMethod() {
     
     }
     */
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass.staticTypeMethod()   // AClass staticTypeMethod
AClass.classTypeMethod()    // AClass classTypeMethod
BClass.classTypeMethod()    // BClass classTypeMethod






// 시스템 음량은 한 기기에서 유일한 값이어야 한다.
struct SystemVolume {
    // 타입 프로퍼티를 사용하면 언제나 유일한 값이 된다.
    static var volume: Int = 5
    
    // 타입 프로퍼티를 제어하기 위해 타입 메서드를 사용한다.
    static func mute() {
        self.volume = 0     // SystemVolume.volume과 같은 표현
                            // Self.volume = 0과도 같은 표현
    }
}

// 네비게이션 역할은 여러 인스턴스가 수행할 수 있다.
class Navigation {
    
    // 네비게이션 인스턴스마다 음량을 따로 설정할 수 있다.
    var volume: Int = 5
    
    // 길 안내 음성 재생
    func guideWay() {
        // 네비게이션 외 다른 재생원 음소거
        SystemVolume.mute()
    }
    
    // 길 안내 음성 종료
    func finishGuideWay() {
        // 기존 재생원 음량 복구
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)  // 0

myNavi.finishGuideWay()
print(SystemVolume.volume)  // 5
