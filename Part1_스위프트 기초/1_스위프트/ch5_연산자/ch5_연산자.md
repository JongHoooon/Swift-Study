# 연산자

## 1. 연산자의 종류

    ### 1.1. 할당 연산자
    * A = B

    ### 1.2. 산술 연산자
    * A + B
    * A - B
    * A * B
    * A / B
    * A % B

>스위프트는 데이터 타입에 엄격해 다른 자료형 끼리의 연산을 엄격히 제한한다.

### 1.3. 비교 연산자
* A == B
* A >= B
* A <= B
* A > B
* A < B
* A != B
* A === B
* A !== B
  * A와 B가 참조(레퍼런스) 타입일 때 A와 B가 같은 인스턴스를 가리키는지 비교
* A ~= B
  * A와 B의 패턴이 매치되는지 확인

> **참초비교 연산자**
> 스위프트의 유일한 참조(Reference) 타입인 클래스의 인스턴스에서만 참조 비교연산자 사용가능

```swift
let referenceA: SomeClass = SomeClass()
let referenceB: SomeClass = SomeClass()
let referenceC: SomeClass = referenceA

let isSameReferenceAB: Bool = referenceA === referenceB     // false
let isSameReferenceAC: Bool = referenceA === referenceC     // true
```

### 1.4. 삼항 조건 연산자
* Question ? A : B
* 조건 안에 또 다른 삼항 연산자를 넣을 수도 있다.

### 1.5 범위 연산자

|연산자|부호|설명|
|------|----|----|
| 폐쇠 범위 연산자 | A...B | A 부터 B 까지, A와 B 포함
| 반폐쇄 범위 연산자 | A..<B | A 부터 B 미만까지, A 포함, B 미포함
| 단방향 범위 연산자 | A... | A 이상의 수,  A 포함
|                    |...A | A 이하의 수, A 포함
|                    |..<A | A 미만의 수, A 미포함 

### 1.6. 부울 연산자
* !B
* A && B
* A || B
  
### 1.7. 비트 연산자
* ~A
* A & B
* A | B
* A ^ B (XOR)
* A >> B
* A << b

### 1.8. 복합 할당 연산자
* A += B
* A -= B
* A *= B
* A /= B
* A %= B
* A <<= N
* A >>= N 
* A &= B
* A |= B
* A ^= B

### 1.9. 오버플로 연산자
* &+
* &-
* &*

```swift
var unsignedInteger: UInt8
let errorUnderflowResult: UInt8 = unsignedInteger - 1   // 런타임 오류
let underflowedValue: UInt8 = unsignedInteger &- 1      // 255
```

### 1.10. 기타 연산자

|연산자|부호|설명|
|------|----|----|
|nil 병합 연산자|A ?? B| A가 nil이 아니면 A를반환, nil이면 B를 반환|
|부호견경 연산자|-A| 부호 변경|
|옵셔널 강제 추출 연산자| O! | 옵셔널 개체의 값을 강제로 추출합니다|
|옵셔널 연산자| V? | V(옵셔널 값)를 안전하게 추출하거나, V(데이터 타입)가 옵셔널임을 표현|

>**nil 병합 연산자**
>옵셔널을 사용할 때 유용하다
>```swift
>// 강제 추출 연산자 사용 지양
>let valueInt: Int = someOptionalInt != nil ? someOptionalInt! : 0
>
>// 같은 결과이지만 안전하게 옵셔널을 다룰 수 있다.
>let valueInt: Int = someOptionalInt ?? 0
>```
>

</br>

## 2. 연산자 우선순위와 결합 방향

</br>

## 3. 사용자 정의 연산자
> 할당 연산자(=)과 삼항 연산자( ? : )는 사용자 정의 역할 부여X

* 기존의 연산자가 전위(prefix), 중위(infix), 후위(postfix) 연산자인지 알아야한다
* 연산자(operator), 연산자 결합방향(associativity), 키워드 우선순위(precedence)
* 아스키(ASCII)문자를 결합해서 사용
  * / = - + ! * < > & | ^ ? ~
* 마침표(.)도 사용자 정의 연산자에 사용 가능
  * 맨 처음의 문자가 마침표일 때만 인식가능
* 물음표(?), 느낌표(!)
  * 사용자 정의 연산자에 포함시킬 수 있지만 자체만으로는 저으이 불가능
  * 전위 연산자는 물음표나 느낌표로 시작하는 사용자 정의 연산자 사용 불가능
* 토큰으로 사용되는 연산자들은 재정의, 사용자 정의 연산자로 사용 불가능
  * = => // ?* */ . 전위연산자< & ? 중위연산자? 후위연산자> ! ? 등

### 3.1. 전위 연산자 정의와 구현

* 정의 & 구현

```swift
// 전위 연산자 정의
prefix operator **

// 어떤 데이터 타입에 이 연산자가 동작할 것인지 함수를 구현
// func앞에 prefix 키워드 삽입
prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive)    // 25
```

* 스위프트 표준 라이브러리에 존재하는 전위 연산자에 기능을 추가할 때는 따로 연산자를 정의하지 않고 중복정의(overload) -> 기존 연산자의 우선순위, 결합방향 등을 변경할 수 없다.

```swift
prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "yagom"
var isEmptyString: Bool = !stringValue
print(isEmptyString)    // false
```

```swift
prefix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive)    // 25

// ** 연산자를 String 타입에서도 동작 하도록 중복 정의
prefix func ** (value: String) -> String {
    return value + " " + value 
}

let resultString: String = **"yagom"
print(resultString)     // yagom yagom
```

### 3.2. 후위 연산자 정의와 구현
* posifx 키워드 사용
* 하나의 피연산자에 전위 연산과 후위 연산을 한 줄에 사용하게 되면 후위 연산을 먼저 수행한다.

```swift
prefix operator **
postfix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let sqrtFivePlusTne: Int = **five**

print(sqrtFivePlusTne)      // ( 10 + 5 ) * ( 10 + 5 ) == 225
```

### 3.3. 중위 연산자 정의와 구현
* infix키워드 사용
* 우선순위 그룹을 명시해줄 수 있다.
  * 전위, 후위 연산자는 결합방향 및 우선순위 지정X
* precedencegroup 뒤에 그룹 이름을 써주어 정의 
* 결합방향이 없는(none)이면 여러 번 연달아 사용할 수 없다.  
  * <, >
* assignmet는 옵셔널 체이닝과 관련
  * 연산자가 옵셔널 체이닝을 포함한 연산에 포함되어 있을 경우 연산자의 우선순위를 지정
  * true - 표준 라이브러리의 할당 연산자와 동일 결합방향(오른쪽)
  * false, 명시x - 할당을 하지 않는 연산자와 같은 옵셔널 체이닝 규칙(왼쪽)
* 우선순위 그룹을 명시하지 않으면 가장 높은 DefaultPrecedence그룹

```swift
precedencegroup 우선순위그룹이름 {
    higherThan: 더낮은우선순위그룹이름
    lowerThan: 더높은우선순위그룹이름
    associativity: 결합방향     // left / right / none
    assignment: 할당방향사용    // true / false
}
```

* 중위 연산자 구현&사용

```swift
// String 타입의 contains(_:) 메서드를 사용하기 위해 Foundation 프레임워크를 임포트 한다.
import Foundation

infix operator **: MultiplicationPrecedence

func ** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}

let helloHoon: String = "Hello hoon"
let hoon: String = "hoon"
let isContainsHoon: Bool = helloHoon ** hoon   
print(isContainsHoon)    // true
```

* 클래스, 구조체와 응용
  
```swift
class Car {
    var modelYear: Int?     // 연식
    var modelName: String?  // 모델 이름
}

struct SmartPhone {
    var company: String?    // 제조사
    var model: String?      // 모델
}

// Car 클래스의 인스턴스끼리 == 연산했을 떄 modelName이 같다면 true를 반환
func == (lhs: Car, rhs: Car) -> Bool {
    return lhs.modelName == rhs.modelName
}

// SmartPhone 구조체의 인스턴스끼리 == 연산했을 때 model이 같다면 true를 반환
func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
    return lhs.model == rhs.model
}

let myCar = Car()
myCar.modelName = "s"

let yourCar = Car()
yourCar.modelName = "s"

print(myCar == yourCar)     // true
```

* 타입 메서드로 구현

```swift
class Car {
    var modelYear: Int?     // 연식
    var modelName: String?  // 모델 이름

    // Car 클래스의 인스턴스끼리 == 연산했을 떄 modelName이 같다면 true를 반환
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.modelName == rhs.modelName
    }
}

struct SmartPhone {
    var company: String?    // 제조사
    var model: String?      // 모델

    // SmartPhone 구조체의 인스턴스끼리 == 연산했을 때 model이 같다면 true를 반환
    static func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
        return lhs.model == rhs.model
    }

}



let myCar = Car()
myCar.modelName = "s"

let yourCar = Car()
yourCar.modelName = "s"

print(myCar == yourCar)     // true
```

