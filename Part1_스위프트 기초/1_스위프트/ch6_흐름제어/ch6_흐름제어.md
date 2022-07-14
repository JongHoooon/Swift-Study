# 흐름제어

> 스위프트의 흐름 제어 구문에서는 소괄호(())를 대부분 생략할 수있다. 소괄호는 사용해도 무관하지만 중괄호({})는 생략할 수 없다.

</br>

## 1. 조건문

### 1.1. if 구문

* 0이 아닌 모든 값을 참으로 취급하는 다른 언어와 달리 **스위프트는 if 구문의 조건값이 꼭 Bool 타입이어야 한다.**

```swift
let first: Int = 5
let second: Int = 5
var biggerValue: Int = 0

if first > second {     // 조건 수식 소괄호는 선택 사항
    biggerValue = first
} else if first == second {
    biggerValue  = first
} else if first < second {
    biggerValue = second
} else if first == 5 {
    // 조건을 충족해도 이미 first == second라는 조건을 충족해 위에서 실행됨
    // 따라서 실행되지 않는다
    biggerValue == 100
}

// 마지막 else는 생략 가능. else if도 생략 가능
// else나 else if 없이 if만 단독 사용 가능
```

### 1.2. switch 구문
* 소괄호(()) 생략 가능
* break 키워드 사용은 선택 사항(case 내부의 코드를 실행하면 break없어도 종료)  
  * case를 연속 실행 하려면 fallthrough 키워드를 사용해야한다.
    * 아래 case 조건에 무관하게 실행한다.
* C언어에서는 정수 타입만 들어갈 수 있으나 스위프트에서는 다양한 값이 들어갈 수 있다. 
  * 숫자(Int, double 등), 문자 문자열, 열거형, 튜플, 범위, 패턴
  * case에 들어갈 비교 값은 입력 값과 데이터 타입이 같아야한다.
  * 비교될 값이 명확히 한정적인 값(열거형 값 등)이 아니면 default 꼭 작성
  * 범위 연산자, where절을 사용해 조건 확장도 가능

```swift
let integerValue: Int = 5

switch integerValue {
    case 0:
        print("Value == zero")
    case 1...10:
        print("Value == 1~10")
        // 이번 case를 마치고 switch구문을 탈출 하지 않는다. 아래 case 조건에 무관하게 실행
        fallthrough
    case Int.min..<0, 101..<Int.max:    // 한 번에 여러 값과 비교할 수 있다.
        print("Value < 0 or Value > 100")
        // break 키워드를 통한 종료는 선택 사항
        break
    // 한정된 범위가 명확지 않다면 default 필수
    default:
        print("10 < Value <= 100")
}
// Value == 1~10
// Value < 0 or Value > 100
```

* 잘못된 case 사용

```swift
let stringValue: String = "Liam Neeson"

switch stringValue {
    case "yagom":
        print("He is yagom")
    // 비교 값은 입력 값과 데이터 타입이 같아야한다
    // 다름으로 오류
    case 3
        print("He is 3")
    case "Jenny":
        // 실행될 코드가 있어야한다.
        // 비어 있으므로 오류
    default:
        print("\(stringValue) said 'I don't know who you are'")
}
```

* switch 구문의 입력 값으로 튜플도 사용

```swift
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
// 이름만 맞았습니다. 나이는 21입니다
```

* let을 붙인 값 바인딩 사용해 미리 지정된 조건 값을 제외한 다른 값을 실행문 안으로 가져온다

```swift
switch tupleValue {
    case ("hoon", 24):
        print("정확히 맞췄습니다!")
    case ("hoon", let age):
        print("이름만 맞았습니다. 나이는 \(age)입니다")
    case(let name, 24):
        print("나이만 맞았습니다. 이름은 \(name)입니다.")
    default:
        print("누굴 찾나요?")    
}
// 이름만 맞았습니다. 나이는 21입니다
```

* where 키워드 사용해 case의 조건 확장

```swift
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
    case "사원" where 인턴인가 == true:
        print("인턴입니다.")
    case "사원" where 연차 < 2 && 인턴인가 == false:
        print("신입사원입니다.")
    case "사원" where 연차 > 5:
        print("연식 좀 된 사원입니다.")
    case "사원":
        print("사원입니다.")
    case "대리":
        print("대리입니다.")
    default: 
        print("사장입니까?")
}
// 신입사원입니다.
```

* 열거형 같이 한정된 범위의 값을 입력 값으로 사용하면 default를 구현하지 않아도 된다.
  * 값에 대응하는 각 case를 구현하지 않는다면 default는 필수

```swift
enum School {
    case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = School.university

switch 최종학력 {
    case .primary:
        print("최종학력은 유치원입니다.")
    case .elementary:
        print("최종학력은 초등학교입니다.")
    case .middle:
        print("최종학력은 중학교입니다.")
    case .high:
        print("최종학력은 고등학교입니다.")
    case .college, .university:
        print("최종학력은 대학(교)입니다.")
    case .graduate:
        print("최종학력은 대학원입니다.")
}
// 최종학력은 대학(교)입니다.
```

* case가 추가될 가능성이 있을때 unknown 속성 활용  
  * case _ 혹은 default에만 적용가능
  * unknown 속성을 부여한 case는 switch구문의 가장 마지막 case로 작성해야함

```swift
enum Menu { 
    case chicken
    case pizza
}

let lunchMenu: Menu = .chicken

switch lunchMenu {
    case .chicken:
        print("반반 무많이")
    case .pizza:
        print("핫소스 많이 주세요")
    case _: // case default: 와 같은 표현이다, case will never be executed 경고 발생
        print("오늘 메뉴가 뭐죠?")
}
```

* unknown 미사용시 문법적으로 오류가 없지만 논리적 오류가 발생할 수 있다.

```swift
enum Menu { 
    case chicken
    case pizza
    case hamburger
}

let lunchMenu: Menu = .chicken


switch lunchMenu { // case will never be executed 경고 발생
    case .chicken:
        print("반반 무많이")
    case .pizza:
        print("핫소스 많이 주세요")
    @unknown case _: // case default: 와 같은 표현이다
        print("오늘 메뉴가 뭐죠?")
}
```

</br>

## 2. 반복문

* C 스타일의 for 구문은 스위프트 3.0에서 삭제
* 조건에 괄호를 생략 가능
* do-while 구문은 스위프트에서 repeat-while 구문으로 구현

### 2.1. for-in 구문

```swift
for i in 0...2 {
    print(i)
}
// 0
// 1
// 2

for i in 0...5 {
    if i.isMultiple(of: 2) {
        print(i)
        continue        // continue 키워드 사용해 바로 다음 시퀀스로
    }
    print("\(i) == 홀수")
}
// 0
// 1 == 홀수
// 2
// 3 == 홀수
// 4
// 5 == 홀수

let helloSwift: String = "Hello Swift"
for char in helloSwift {
    print(char)
}
// H
// e
// l
// l
// o
 
// S
// w
// i
// f
// t

var result: Int = 1

// 시퀀스에 해당하는 값이 필요 없다면 와일드카드 식별자(_)를 사용하면 된다.
for _ in 1...3 {
    result *= 10
}

print("10의 3제곱은 \(result)입니다.")
// 10의 3제곱은 1000입니다.
```

* 컬렉션 타입에서도 사용가능
  * 딕셔너리는 넘겨받는 값의 타입이 튜플로 지정돼 넘어온다.

```swift
// Dictionary
let freinds: [String: Int] = ["jay": 35, "joe": 29, "Jenny": 31]

for tuple in freinds {
    print(tuple)
}
// (key: "jay", value: 35)
// (key: "Jenny", value: 31)
// (key: "joe", value: 29)

// Set
let 지역번호: Set<String> = ["02", "031", "033", "041", "042", "043"]

for 번호 in 지역번호 {
    print(번호)
}
// 043
// 033
// 02
// ...
```

### 2.2. while 구문

```swift
var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]

while names.isEmpty == false {
    print("Good bye \(names.removeFirst())")
    // 요소를 삭제함과 동시에 삭제한 요소를 반환
}
// Good bye Joker
// Good bye Jenny
// Good bye Nova
// Good bye yagom
```

### 2.3. repeat-while 구문
* repeat 블록의 코드를 최초 1회 실행후 while 다음의 조건이 성립하면 내부의 코드를 반복

```swift
var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]

repeat {
    print("Good bye \(names.removeFirst())")
} while names.isEmpty == false
// Good bye Joker
// Good bye Jenny
// Good bye Nova
// Good bye yagom
```

</br>

## 3. 구문 이름표
* 반복문 앞에 이름과 함께 콜론을 붙여 구문의 이름을 지정해주는 구문 이름표를 사용하면 좋다. 
* 이름이 지정된 구문을 제어할떄는 제어 키워드(break, continue 등)와 구문 이름을 함께 써주면 된다

```swift
var numbers: [Int] = [3, 2342, 6, 3252]

numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop
    }

    var count: Int = 0

    printLoop: while true {
        print(num)
        count += 1

        if count == num {
            break printLoop
        }
    }
    
    removeLoop: while true {
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
}
// 3
// 3
// 3
```