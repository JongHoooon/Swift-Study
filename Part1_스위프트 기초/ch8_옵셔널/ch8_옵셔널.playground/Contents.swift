import Darwin

//MARK: - nil 할당

//var myName: String = "hoon"
//myName = nil        // 오류!

//var myName: String? = "hoon"
//print(myName)   // Optional("hoon")
//// 옵셔널 타입의 갑을 print 함수의 매개변수로 전달하면
//// 컴파일러 경고가 발생할 수 있다.
//
//

enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case graduate
}

let primary = School(rawValue: "유치원")
let graduate = School(rawValue: "석박사")
print(primary)
print(graduate)
// Optional(__lldb_expr_8.School.primary)
// nil


//MARK: - switch를 통한 옵셔널 값의 확인

func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

//var myName: String? = "Hoon"
//checkOptionalValue(value: myName)   // Value is Hoon
//
//
//myName = nil
//checkOptionalValue(value: myName)   // This Optional variable is nil


let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative Value!! \(value)")
    case .some(let value) where value > 10:
        print("Large value!! ")
    
    case .some(let value):
        print("Value \(value)")
    case .none:
        print("nil")
    }
}
// Value 2
// nil
// Negative Value!! -4
// nil
// Large value!!

//MARK: - 강제 추출

//var myName: String? = "hoon"
//
//// 옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없습니다. 추출해서 할당해 주어야 한다.
//var hoon: String = myName!
//
//myName = nil
//hoon = myName!      // 런타임 오류!
//
//
//// if 구문 등 조건문을 이용해 안전하게 처리
//if myName != nil {
//    print("My name is \(myName!)")
//} else {
//    print("My name == nil")
//}
//
//// My name == nil


//MARK: - 옵셔널 바인딩

//var myName: String? = "hoon"
//
//// 옵셔널 바인딩을 통한 임시 상수 할당
//if let name = myName {
//    print("My name is \(name)")
//} else {
//    print("myName == nil")
//}
//// My name is hoon
//
//
//// 옵셔널 바인딩을 통한 임시 변수 할당
//if var name = myName {
//    name = "wizplan"    // 변수이므로 내부에서 변경이 가능하다
//    print("My name is \(name)")
//} else {
//    print("myName == nil")
//}
//// My name is wizplan


//var myName: String? = "hoon"
//var yourName: String? = nil
//
//// friend에 바인딩이 되지 않으므로 실행되지 않습니다.
//if let name = myName, let friend = yourName {
//    print("We are friend! \(name) & \(friend)")
//}
//
//yourName = "eric"
//if let name = myName, let friend = yourName {
//    print("We are friend \(name) & \(friend)")
//}
////We are friend hoon & eric


//MARK: - 암시적 추출 옵셔널의 사용

var myName: String! = "hoon"
var name: String

name = myName
print(myName)   // Optional("hoon")

myName = nil
// 암시적 추출 옵셔널도 옵셔널이므로 당연히 바인딩 사용 가능
if let name = myName {
    print("My name is \(name)")
} else {
    print("myName == nil")
}
// myName == nil

//myName.isEmpty      // 오류!!


