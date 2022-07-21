# 구조체와 클래스

* 데이터를 용도에 맞게 묶어 표현가능
* 프로퍼티와 메서드를 사용해 구조화된 데이터와 기능을 가질 수 있다.
* 새로운 사용자 정의 데이터 타입을 만들어 준다.
* 구조체의 인스턴스는 값 타입
* 클래스의 인스턴스는 참조 타입

</br>

## 1. 구조체

</br>

### 1.1. 구조체 정의

* struct 키워드 사용
* 구조체의 이름은 대문자 카멜케이스
* 프로퍼티와 메서드 이름은 소문자 카멜케이스

```swift
struct BasicInformation {
    var name: String
    var age: Int
}
```

</br>

### 1.2. 구조체와 인스턴스의 생성 및 초기화

* 인스턴스 생성하고 초기화하고자 할 때는 기본적으로 생성되는 멤버와이즈 이니셜라이저 사용
* 기본 생성된 이니셜라이저의 매개변수는 구조체의 프로퍼티 이름으로 자동 지정

```swift
// 프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100         // 변경 가능
yagomInfo.name = "Seba"     // 변경 가능

// 프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
let sebaInfo: BasicInformation = BasicInformation(name: "Seba", age: 99)
sebaInfo.age = 100          // 변경 불가! 오류!
```

</br>

## 2. 클래스

</br>

### 2.1. 클래스의 정의

* class 키워드 사용
* 클래스의 이름 대문자 카멜케이스 사용
* 프로퍼티와 메서드 이름은 소문자 카멜케이스 사용

```swift
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}
```

</br>

### 2.2. 클래스 인스터스의 생성과 초기화

* 인스턴스를 생성하고 초기화 할때 기본적인 이니 셜라이저를 사용한다.
* Person 클래스에서는 프로퍼티의 기본값이 지정되어 있으므로 전달 인자를 통하여 따로 초깃값 전달 안해도된다.
* 클래스의 인스턴스는 **참조 타입**이므로 클래스의 인스턴스 상수 let으로 선언해도 내부 프로퍼티 값을 변경할 수 있다.

```swift
var yagom: Person = Person()
yagom.height = 123.4    // 변경 가능
yagom.weight = 123.4    // 변경 가능

let jenny: Person = Person()
jenny.height = 123.4    // 변경 가능
jenny.weight = 123.4    // 변경 가능
```

</br>

### 2.3. 클래스 인스턴스의 소멸
* 소멸(deinit): 클래스의 인스턴스는 참조 타입이므로 참조할 필요가 없을 때 메모리에서 해체된다.
* 디이니셜라이저(Deinitializer)
* 클래스당 하나만 구현 가능
* 매개변수와 반환 값을 가질 수 없다.   
  * 매개변수를 위한 소괄호도 생략

```swift
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var yagom: Person? = Person()
yagom = nil     // Person 클래스의 인스턴스가 소멸됩니다.
```

* 인스턴스가 메모리에서 해체되기 직전에 처리할 코드를 넣어준다.
  * 데이터 저장
  * 다른 객체에 인스턴스 소멸을 알려야 할때

</br>

## 3. 구조체와 클래스의 차이

### 공통점

* 값을 저장하기 위해 프로퍼티를 정의할 수 있다.
* 기능 실행을 위해 메서드를 정의할 수 있다.
* 초기화될 때의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있다.
* 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있다.
* 특정 기능을 실행하기 위해 특정 프로토콜을 준수할 수 있다.

</br>

### 차이점

* 구조체는 상속할 수 없다.
* 타입캐스팅은 클래스의 인스턴스에만 허용된다.
* 디이니셜라이저는 클래스의 인스턴스에만 활용할 수 있다.
* 참조 횟수 계산(Reference Counting)은 클래스의 인스턴스에만 적용된다.
* 클래스의 인스턴스는 **참조 타입**, 구조체의 인스턴스는 **값 타입**


### 3.1. 값 타입과 참조 타입

* 무엇이 전달되는가
  * 값 타입이 전달인자: 전달될 값이 복사되어 전달
  * 참조 타입이 전달인자: 참조(주소)가 전달

```swift
truct BasicInformation {
    var name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100

// yagomInfo의 값을 복사하여 할당합니다!
var friendInfo: BasicInformation = yagomInfo

print("yagom's age: \(yagomInfo.age)")      // 100
print("friend's age: \(friendInfo.age)")    // 100

friendInfo.age = 999

print("yagom's age: \(yagomInfo.age)")      // 100 - yagom의 값은 변동 없다.
print("friend's age: \(friendInfo.age)")    // 999
// friendInfo는 yagoInfo의 값을 복사해왔기 때문에 별개의 값을 갖습니다.

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
var friend: Person = yagom                  // yagom의 참조를 할당한다!

print("yagom's height: \(yagom.height)")    // 0.0
print("friend's height: \(friend.height)")  // 0.0

friend.height = 185.5
print("yagom's height: \(yagom.height)")
// 185.5 - friend는 yagom을 참조하기 때문에 값이 변동됩니다.

print("friend's height: \(friend.height)")
// 185.5 - 이를 통해 yagom이 참조하는 곳과 friend가 참조하는 곳이 같음을 알 수 있다.


func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}
func changePersonInfo(_ info: Person) {
    info.height = 155.3
}

// changeInfo(_:)로 전달되는 전달인자는 값이 복사되어 전달되기 때문에
// yagomInfo의 값만 전달되는 것이다.
changeBasicInfo(yagomInfo)
print("yagom's age: \(yagomInfo.age)")      // 100

// changePersonInfo(_:)의 전달인자로 yagom의 참조가 전달되었기 때문에
// yagom이 참조하는 값들에 변화가 생긴다.
changePersonInfo(yagom)
print("yagom's height: \(yagom.height)")    // 155.3
```

* 값 타입의 데이터를 함수의 전달인자로 전달하면 메모리에 전달인자를 위한 인스턴스가 새로 생성되고 값이 복사되어 들어간다.
* 참조 타입의 데이터는 전달인자로 전달할 때 기존 인스턴스의 참조를 전달해 새로운 인스턴스가 아닌 기존의 인스턴스 참조를 전달한다.

</br>

* 식별 연산자(Identity Operators): 클래스의 인스턴스끼리 참조가 같은지 확인할때 사용

```swift
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
```

</br>

### 3.2. 스위프트의 기본 데이터 타입은 모두 구조체

* 기본 데이터 타입은 모두 값 타입이다.
* C 언어 등의 코딩스타일처럼 함수의 전달인자로 참조를 전달하고 싶다면 매개변수를 사용.

</br>

## 4. 구조체와 클래스 선택해서 사용하기

* 구조체
  * 연간되 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
  * 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
  * 구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
  * 다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때
  * 좌표계(x, y), 물건의 크기(width, height, depth)
