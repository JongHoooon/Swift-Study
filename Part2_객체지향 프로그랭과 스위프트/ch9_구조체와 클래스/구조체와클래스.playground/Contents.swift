//
//
//// 프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
//var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
//yagomInfo.age = 100         // 변경 가능
//yagomInfo.name = "Seba"     // 변경 가능
//
//// 프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
//let sebaInfo: BasicInformation = BasicInformation(name: "Seba", age: 99)
////sebaInfo.age = 100          // 변경 불가! 오류!
//
//
//class Person {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//
//    deinit {
//        print("Person 클래스의 인스턴스가 소멸됩니다.")
//    }
//}
//
//
////var yagom: Person = Person()
////yagom.height = 123.4    // 변경 가능
////yagom.weight = 123.4    // 변경 가능
////
////let jenny: Person = Person()
////jenny.height = 123.4    // 변경 가능
////jenny.weight = 123.4    // 변경 가능
//
//var yagom: Person? = Person()
//yagom = nil     // Person 클래스의 인스턴스가 소멸됩니다.

//MARK: - 참조 타입, 값 타입
//
//struct BasicInformation {
//    var name: String
//    var age: Int
//}
//
//var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
//yagomInfo.age = 100
//
//// yagomInfo의 값을 복사하여 할당합니다!
//var friendInfo: BasicInformation = yagomInfo
//
//print("yagom's age: \(yagomInfo.age)")      // 100
//print("friend's age: \(friendInfo.age)")    // 100
//
//friendInfo.age = 999
//
//print("yagom's age: \(yagomInfo.age)")      // 100 - yagom의 값은 변동 없다.
//print("friend's age: \(friendInfo.age)")    // 999
//// friendInfo는 yagoInfo의 값을 복사해왔기 때문에 별개의 값을 갖습니다.
//
//class Person {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//}
//
//var yagom: Person = Person()
//var friend: Person = yagom                  // yagom의 참조를 할당한다!

//print("yagom's height: \(yagom.height)")    // 0.0
//print("friend's height: \(friend.height)")  // 0.0
//
//friend.height = 185.5
//print("yagom's height: \(yagom.height)")
//// 185.5 - friend는 yagom을 참조하기 떄문에 값이 변동됩니다.
//
//print("friend's height: \(friend.height)")
//// 185.5 - 이를 통해 yagom이 참조하는 곳과 friend가 참조하는 곳이 같음을 알 수 있다.
//
//
//func changeBasicInfo(_ info: BasicInformation) {
//    var copiedInfo: BasicInformation = info
//    copiedInfo.age = 1
//}
//func changePersonInfo(_ info: Person) {
//    info.height = 155.3
//}
//
//// changeInfo(_:)로 전달되는 전달인자는 값이 복사되어 전달되기 때문에
//// yagomInfo의 값만 전달되는 것이다.
//changeBasicInfo(yagomInfo)
//print("yagom's age: \(yagomInfo.age)")      // 100
//
//// changePersonInfo(_:)의 전달인자로 yagom의 참조가 전달되었기 떄문에
//// yagom이 참조하는 값들에 변화가 생긴다.
//changePersonInfo(yagom)
//print("yagom's height: \(yagom.height)")    // 155.3


class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var hoon: Person = Person()
let friend: Person = hoon               // hoon의 참조를 할당한다
let anotherFriend: Person = Person()    // 새로운 인스턴스를 생성

print(hoon === friend)          // true
print(hoon === anotherFriend)   // false
print(friend !== anotherFriend) // true

