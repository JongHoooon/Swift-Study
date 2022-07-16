# 데이터 타입 고급 

## 1. 데이터 타입 안심
* 안전성(safe)
  * 스위프트 발표할 때 안전성 강조
  * 서로 다른 타입끼리 데이터 교환은 꼭 타입캐스팅(Type-Casting, 형변환)을 거쳐야 한다.
* 데이터 타입 안심(Type-safe)언어  
  * 타입을 안심하고 사용할 수 있다.
  * 타입 확인 : 스위프트가 컴파일 시 타입을 확인한다.
* 타입 추론
  * 변수나 상수를 선언할 때 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 변수나 상수의 타입을 결정한다.
  
  </br>

## 2. 타입 별칭

* 사용자가 임의로 만든 데이터 타입이든 이미 존재하는 대이터 타입에 임의로 다른 이름(별칭)부여 가능
  
```swift
typealias MyInt = Int

let age: MyInt = 100
```

</br>

## 3. 튜플(Tuple)
* 타입의 이름이 따로 지정되어 있지 않고 마음대로 만드는 타입이다.(지정된 데이터의 묶음)
  
```swift
// String, Int, Double 타입을 갖는 튜플
var person: (String, Int, Double) = ("hoon", 100, 182.5)

// 인덱스를 통해 값을 빼 올 수 있다.
print("이름: \(person.0), 나이 \(person.1), 신장: \(person.2)")

// 인덱스를 통해 값을 할당
person.1 = 99
person.2 = 178.5

print("이름: \(person.0), 나이 \(person.1), 신장: \(person.2)")

// 이름: hoon, 나이 100, 신장: 182.5
// 이름: hoon, 나이 99, 신장: 178.5
```

* 가독성을 위해 튜플의 요소마다 이름 붙이기 가능


```swift
// String, Int, Double 타입을 갖는 튜플
var person: (name: String, age: Int, height: Double) = ("hoon", 100, 182.5)

// 요소 이름을 통해서 값을 빼 올 수 있다.
print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")

person.age = 24     // 요소 이름을 통해 값을 할당
person.2 = 188      // 인덱스를 통해서도 값을 할당

// 인덱스를 통해 값 출력
print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")

// 이름: hoon, 나이: 100, 신장: 182.5
// 이름: hoon, 나이: 24, 신장: 188.0
```
* 튜플 별칭 사용

```swift
typealias PersonTuple = (name: String, age: Int, Height: Double)

let hoon: PersonTuple = ("hoon", 100, 183.3)
let jong: PersonTuple = ("jong", 24, 188.8)
```

</br>

## 4. 컬렉션형

>많은 수의 데이터를 묶어서 저장 관리할 수 있다.
>배열(Array), 딕셔너리(Dictionary), 세트(Set)


* 배열(Array): 같은 타입의 대이터를 일렬로 나열한 후 순서대로 저장
  * 스위프트의 Array는 C언어의 배열처럼 버퍼(Buffer)이지만 자동으로 버퍼의 크기를 조절해줘 요소의 삽입 및 삭제가 자유롭다.

```swift
// 대괄호를 사용하여 배열임을 표현한다.
var nmaes: Array<String> = ["yagom", "chulsoo", "younghee", "yagom"]

// 위 선언과 정확히 동일한 표현.
var names: [String] = ["yagom", "chulsoo", "yonghee", "yagom"]

var emptyArray: [Any] = [Any]()         // Any 데이터를 요소로 갖는 빈 배열 생성
var emptyArray: [Any] = Array<Any>()    // 위 선언과 정확히 같은 동작

// 배열의 타입을 정확히 명시해주면 []만을도 빈 배열 생성 가능
var emptyArray: [Any] = []  

print(emptyArray.isEmpty)   // true
print(names.count)          // 4
```

  * 각 요소에 인덱스를통해 접근가능(0부터 시작),first, last 프로퍼티 사용가능
  * firstIndex(of:): 해당 요소의 인덱스 반환(중복시 처번째 인덱스 반환)
  * append(_:): 맨뒤에 요소를 추가
  * insert(_:at:): 중간에 요소 사입
  * remove(_:): 요소를 삭제후 반환  

```swift
var names: [String] = ["yagom", "chulsoo", "yonghee", "yagom"]

print(names[2])         // yonghee
names[2] = "jenny"
print(names[2])
// print(names[4])

// names[4] = "elsa"            // 범위를 벗어나 익셉션 오류(Exception Error)
names.append("elsa")            // 마지막에 elsa 추가
names.append(contentsOf: ["John", "max"])   // 마지막에 요소 2개 추가
// 인덱스 5의 위치에 삽입
names.insert("happy", at: 2)
names.insert(contentsOf: ["jinhee", "minsoo"], at: 5)

// 옵셔녈
print(names.firstIndex(of: "yagom"))
print(names.firstIndex(of: "christal"))
print(names.first)
print(names.last)


print("names: \(names)")
let firstItem: String = names.removeFirst()
let lastItem:  String = names.removeLast()
let indexZeroItem: String = names.remove(at: 0)


print(firstItem)
print(lastItem)
print(indexZeroItem)
print(names[1...3])
```

* 딕셔너리
  * 요소들이 순서 없이 키와 값의 쌍으로 구성(키는 중복 불가, 값은 중복 가능)
  
```swift
// typealias를 통해 조금 더 단순하게 표현
typealias StringIntDictionary = [String: Int]

// 키는 String, 값은 Int 타입인 빈 딕셔너리를 생성
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()

// [String: Int]는 Dictionary<String, Int>축약 표현
var numberForName: [String: Int] = [String: Int]()

// 위 코드와 동일
var numberForName: StringIntDictionary = StringIntDictionary()

// 딕셔너리 키와 값 타입을 정확히 명시하면 [:]으로 빈 딕셔너리 생성
var numberForName: [String: Int] = [:]

// 초깃값 주어 생성 
var numberForName: [String: Int] = ["yagom": 100, "chulsoo": 200, "jenny": 300]

print(numberForName.isEmpty)    // false
print(numberForName.count)      // 3
```

  * 딕셔너리는 각 값에 키로 접근가능
  * 배열과 다르게 내부에 없는 키로 접근해도 오류 발생하지 않고 nil 반환
  * removeValue(forkey: ) : 특정 키에 해당하는 값 제거 후 값 반환(옵셔널)

```swift
var numberForName: [String: Int] = ["yagom": 100, "chulsoo": 200, "jenny": 300]

print(numberForName["chulsoo"])     // 200
print(numberForName["minji"])       // nil

numberForName["chulsoo"] = 150
print(numberForName["chulsoo"])     // 150

numberForName["max"] = 999          // max라는 키로 999라는 값을 추가
print(numberForName["max"])         // 999

print(numberForName.removeValue(forKey: "yagom"))   // 100

// 위에서 yagom 키에 해당하는 값이 이미 삭제돼 nil 반환
// 키에 해당 값이 없으면 기본값을 돌려주도록 할 수 있다.
print(numberForName.removeValue(forKey: "yagom"))

// yagom 키에 해당하는 값이 없으면 기본으로 0이 반환
print(numberForName["yagom", default: 0])           // 0
```

* 세트
  * 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장(중복X)
  * 순서가 중요하지 않거나 각 요소가 유일한 값이어야 하는 경우
  * 세트의 요소는 해시 가능한값(Hashable 프로토콜을 따른다)(기본 데이터 타입은 모두 Hashable)
  * 배열과 달리 축약형 불가능


```swift
var names: Set<String> = set<String>()      // 빈 세트 생성
var names: Set<String> = []                 // 빈 세트 생성

// Array와 마찬가지로 대괄호를 사용
var names: Set<String> = ["yagom", "chulsoo", "yonghee", "yagom"]

// 따라서 타입 추론을 사용하면 컴파일러는 Set가 아닌 Array로 타입을 지정한다.
var numbers = [100, 200, 300]
print(type(of: numbers))    // Array<Int>

print(names.isEmpty)        // false
print(names.count)          // 3 ("yagom" 중복 안됨)
```

* insert(_:) : 세트에 요소를 추가
* remove(_:) : 요소를 삭제

```swift
var names: Set<String> = ["yagom", "chulsoo", "younghee"]

print(names.count)          // 3
names.insert("jenny")
print(names.count)          // 4

print(names.remove("chulsoo"))  // chulsoo
print(names.remove("john"))     // nil
```


  * 세트는 요소들이 유일합을 보장하므로, 집합관계 표현시 유용
  * 교집합, 합집합 등을 연산가능
    *  intersection, symmetricDifference, union, subtracting
  * sorted()를 통해서 정렬 가능
    * sorted
  * 포함 관계 연산 가능(배타적, 부분집합, 전체집합)
    * isDisjoint, isSubset, isSuperset

>## **TIP** 컬렉션에서 임의의 요소 추출과 뒤섞기
> * randomElement()
> * shuffle()

## 5. 열거형

* 연관된 항목들을 묶어서 표현
* 배열, 딕셔너리같은 타입과 다르게 정해준 항목 값 외에는 추가/수정이 불가능하다.
* 사용 상황
  * 제한된 선택지를 주고 싶을 때
  * 정해진 값 외에는 입력받고 싶지 않을 떄
  * 예상된 입력 값이 한정되어 있을 때
* 스위프트의 열거형은 항목별로 값을 가질 수도, 가지지 않을 수도 있다.(각 항목이 그 자체로 고유의 값이 될 수 있다.)
* 각 항목이 원시 값(Raw Valeu)형태로 (정수, 실수, 문자 타입 등의) 실제 값을 가질수도 있다.
* 연관 값(Associated Values)을 사용하여 다른 언어에서 공용체라 불리는 값의 묶음으로도 구현 가능
* switch 구문과 만났을때 멋지다

```swift
enum School {
    case primary        // 유치원
    case elementary     // 초등
    case middle         // 중등
    case high           // 고등
    case college        // 대학
    case university     // 대학교
    case graduate       // 대학원
}

enum School {
    case primary, elementary, middle, high, college, university, graduate 
}

// School이라는 이름을 갖는 열거형에 각 항목이 있다.
// 각 항목은 그자체가 고유값이다
// 한 줄로도 표현가능 
```

* 열겨형 변수 생성, 값 할당
  
```swift
enum School {
    case primary, elementary, middle, high, college, university, graduate 
}

var highestEducationLevel: School = School.university

// 위 코드와 같은 표현
var highestEducationLevel: School = .university

// 같은 타입인 School 내부의 항목으로만 highestEducationLevel의 값 변경 가능
highestEducationLevel = .graduate 
```

* 원시 값
  * 항목의 원시값(Raw Value)도 가질 수 있다.
  * 특정 타입으로 지정된 값을 가질 수 있다.

```swift
enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel: School = School.university
print("저의 최종학련은 \(highestEducationLevel) 졸업입니다.")
print("저의 최종학련은 \(highestEducationLevel.rawValue) 졸업입니다.(원시값)")

enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = WeekDays.fri
print("오늘은 \(today.rawValue)")


// 저의 최종학련은 university 졸업입니다.
// 저의 최종학련은 대학교 졸업입니다.(원시값)
// 오늘은 금
```

* 일부 항목만 원시 값 설정도 가능
  * 문자열 타입은 각 항목 이름을 그대로 원시값으로 사용
  * 정수 타입은 첫 항목을 기준으로 0부터 1씩 늘어난다.

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

let highestEducationLevel: School = .university
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")
// 저의 최종학력은 university 졸업입니다.

enum Numbers: Int {
    case zero
    case one
    case two
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)") // 0, 1, 2, 10
```
* 열거형이 원시 값을 갖을 때, 원시 값 정보를 안다면 원시 값을 통해 열거형 변수 또는 상수를 생성 가능. 
* 옯바르지 않은 원시 값을 통해 상성하려고하면 nil반환(실패 가능한 이니셜라이저)

```swift
let primary = School(rawValue: "유치원")    // primary
let graduate = School(rawValue: "석박사")   // nil

let one = Number(rawValue: 1)               // one
let three = Number(rawValue: 3)             // nil
```

* 연관 값
  * 스위프트의 열거형 각 항목이 연관 값을 가지면 기존 언어의 공용체 형태를 띈다.
  * case가 자신과 연관된 값을 가질 수 있다.
  * 모든 항목이 안가져도 된다.

```swift
enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: "크림")        // 크림 파스타
dinner = .pizza(dough: "치크크러스트", topping: "불고기")   // 불고기 치즈크러스트 피자
dinner = .chicken(withSauce: true)                          // 양념 통닭
dinner = .rice                                              // 밥 
```

* 열거형 응용

```swift
enum PastaTaste {
    case cream, tomato
}

enum PizzeDough {
    case cheeseCrust, thin, origin
}

enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDish {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzeDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: PastaTaste.tomato)
dinner = MainDish.pizza(dough: .cheeseCrust, topping: .bacon)
```

* 항목 순회 
  * 열거형에 포함된 모든 케이스를 알아야 할 떄 CaseIterable 프로토콜 사용해 allCases라는 타입 프로퍼티 사용
  * 원시값을 갖는다면
    * enum School: String, CaseIterable { }

```swift
enum School: CaseIterable {
    case primary        // 유치원
    case elementary     // 초등
    case middle         // 중등
    case high           // 고등
    case college        // 대학
    case university     // 대학교
    case graduate       // 대학원
}

let allCases: [School] = School.allCases
print(allCases)
// [main.School.primary, main.School.elementary, main.School.middle, main.School.high, main.School.college, main.School.university, main.School.graduate]
```
* 순환 열겨형 
  * 열거형 학목의 연관 값이 열거형 자신의 값이고자 할 떄
  * indirect 키워드 사용
  * 이진 탐색트리 등의 순환 알고리즘 구현할 때 유용


```swift
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// indirect enum ArithmeticExpression {
//     case number(Int)
//     case addition(ArithmeticExpression, ArithmeticExpression)
//     case multiplication(ArithmeticExpression, ArithmeticExpression)
// }

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
        case .number(let value):
            return value
        case .addition(let left, let right):
            return evaluate(left) + evaluate(right)
        case .multiplication(let left, let right):
            return evaluate(left) * evaluate(right)       
    }
}

let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")    // (5 + 4) * 2 = 18
```

* 비교 가능한 열거형
  * Comparable 프로토콜 사용(앞에 위치한 케이스가 더 작은 값)

```swift
enum Condition: Comparable {
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else {
    print("당신의 상태가 더 좋아요")
}
// 제 상태가 더 좋군요

enum Device: Comparable {
    case iPhone(vestion: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(vestion: "14.3"))
devices.append(.iPhone(vestion: "6.1"))
devices.append(.iPad(version: "10.3"))
devices.append(.macBook)

let sortedDevics: [Device] = devices.sorted()
print(sortedDevics)
// [main.Device.iPhone(vestion: "14.3"), main.Device.iPhone(vestion: "6.1"), main.Device.iPad(version: "10.3"), main.Device.macBook, main.Device.iMac]
```