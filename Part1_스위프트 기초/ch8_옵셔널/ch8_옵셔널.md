# 옵셔널(Optionals)

* 안전성(safe)을 문법으로담보하는 기능
* 변수 또는 상수의 값이 nil일 수도 있다는것을 의미

</br>

## 1. 옵셔널 사용

* 옵셔널 변수 또는 상수가 아니면 nil을 할당할 수 없다.
* ""도 빈 문자열 이라는 값이다, nil이 아니다
* 값이 없는 옵셔널 변수 또는 상수에(강제로) 접근하려면 런타임 오류가 발생하고 OS가 프로그램을 강제 종료시킬 확률이 매우 놓다.

```swift
var myName: String = "hoon"
myName = nil        // 오류!
```

```swift
var myName: String? = "hoon"
print(myName)   // Optional("hoon")
// 옵셔널 타입의 갑을 print 함수의 매개변수로 전달하면
// 컴파일러 경고가 발생할 수 있다.
```

* var Nmae: Optional\<String> 처럼 옵셔널을 명확하게 써줄 수도 있다.
* 옵셔널 사용 상황
  * 함수에 전달되는 전달인자의 값이 잘못된 값일 경우 제대로 처리하지 못했음을 nil을 반환하여 오류를 표현
  * 매개변수를 굳이 넘기지 않아도 된다는 뜻으로 매개변수의 타입을 옵셔널로 정의
* 옵셔널은 열거형으로 구현되어 있다.
  * case none
  * case some(Wrapped)

* 옵셔널로 데이터 타입 추론
  * School? 로 추출

```swift
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
```

</br>

* switch를 통한 옵셔널 값의 확인

```swift
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

var myName: String? = "Hoon"
checkOptionalValue(value: myName)   // Value is Hoon


myName = nil
checkOptionalValue(value: myName)   // This Optional variable is nil
```

</br>

```swift
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
```

</br>

## 2. 옵셔널 추출
* 옵셔널 추출(Optional Unwrapping): 열거형의 some 케이스로 숨어 있는 옵셔널의 값을 값으로 추출

</br>

### 2.1. 강제 추출
* 옵셔널 강제 추출(Forced Unwrapping): 옵셔널의 값을 추출하는 가장 간단한 방법이지만 가장 위험한 방법
* 런타임 오류 발생 가능성이 높다
* 강제 추출 시 옵셔널에 값이 없다면(nil) 런타임 오류 발생

```swift
var myName: String? = "hoon"

// 옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없습니다. 추출해서 할당해 주어야 한다.
var hoon: String = myName!

myName = nil
hoon = myName!      // 런타임 오류!


// if 구문 등 조건문을 이용해 안전하게 처리
if myName != nil {
    print("My name is \(myName!)")
} else {
    print("My name == nil")
}

// My name == nil
```

</br>

### 2.2. 옵셔널 바인딩
* 옵셔널 바인딩(Optional Binding): 옵셔널에 값이 있는지 확인할 때 사용한다. 값이 있다면 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌 형태로 사용할 수 있도록 해준다.

</br>

* if 구문을 실행하는 블록 안쪽에서만 name이라는 임시 상수 사용 가능
  * if 블록 밖, else

```swift
var myName: String? = "hoon"

// 옵셔널 바인딩을 통한 임시 상수 할당
if let name = myName {
    print("My name is \(name)")
} else {
    print("myName == nil")
}
// My name is hoon


// 옵셔널 바인딩을 통한 임시 변수 할당
if var name = myName {
    name = "wizplan"    // 변수이므로 내부에서 변경이 가능하다
    print("My name is \(name)")
} else {
    print("myName == nil")
}
// My name is wizplan
```

* 옵셔널 바인딩을 사용한 여러 개의 옵셔널 값의 추출

```swift
var myName: String? = "hoon"
var yourName: String? = nil

// friend에 바인딩이 되지 않으므로 실행되지 않습니다.
if let name = myName, let friend = yourName {
    print("We are friend! \(name) & \(friend)")
}

yourName = "eric"
if let name = myName, let friend = yourName {
    print("We are friend \(name) & \(friend)")
}
//We are friend hoon & eric
```

</br>

### 2.3. 암시적 추출 옵셔널

* 암시적 추출 옵셔널(Implicitly Unwrapped Optionals): nil을 할당하고 싶지만, 옵셔널 바인딩으로 매번 값을 추출하기 귀찮거나 로직상 nil 떄문에 런타임 오류가 발생하지 않을 것 같다는 확신이 들때 nil을 할당해줄 수 있는 옵셔널이 아닌 변수나 상수가 필요할때 사용한다.
* 암시적 추출 옵셔널로 지정된 타입은 일반 값처럼 사용할 수 있지만, 옵셔널이기 떄문에 nil도 할당해줄 수 있다.
* nil이 할당되어 있을 때 접근을 시도하면 런타임 오류가 발생한다.
* 타입 뒤에 느낌표(!)를 사용해주면 된다

```swift
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
```

</br>

### **강제 추출, 암시적 추출 보다는 옵셔널 바인딩, nil 병합 연산자, 옵셔널 체이닝 등의 방법을 사용하는 편이 훨씬 안전하고 스위프트의 지향점에 부합하다.**