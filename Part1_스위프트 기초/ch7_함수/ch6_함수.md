# 함수 

>* 함수를 일급 객체(First-class Citizen)로 다룬다
> * 전달인자(Argument)로 전달할 수 있다.
>  * 동적 프로퍼티 할당이 가능하다.
>  * 변수나 데이터 구조 안에 담을 수 있다.
>  * 반환 값으로 사용할 수 있다.
>  * 할당할 때 사용된 이름과 관계없이 고유한 객체로 구별 가능하다. 

</br>

## 1. 함수와 메서드
* 기본적으로 같지만 상황이나 위치에 따라 다른 용어로 부른다.
  * 메서드: 구조체, 클래스, 열거형 등 특정 타입에 연관돼 사용하는 함수
  * 함수: 모듈 전체에서 전역적으로 사용할 수 있는 함수

</br>

## 2. 함수의 정의와 호출
* 조건문, 반복문과 달리 소괄호(()) 생략 불가능  </br>
* 재정의(override), 중복 정의(overload) 지원
  
### 2.1. 기본적인 함수의 정의와 호출
* 함수의 이름, 매개변수(Parameter), 반환 타임(Return Type)등을 사용
* return 생략
  * 함수 내부의 코드가 단 한 줄의표현이 가능
  * 그 표현의 결과값의 타입이 함수의 반환 타입과 일치

```swift
func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloHoon: String = hello(name: "Hoon")
print(helloHoon)    // Hello Hoon!

func introduce(name: String) -> String {
    // return "제 이름은 " + name + "입니다" 
    "제 이름은 " + name + "입니다"
}

let introduceHoon: String = introduce(name: "Hoon")
print(introduceHoon)    // 제 이름은 Hoon입니다
```

</br>

>* 매개변수와 전달인자
>  * 매개변수(Parameter): 함수를 정의할 떄 외부로 부터 받아들이는 전달 값의 이름
>       * 위에 코드에서 name
>  * 전달인자(Argument): 함수를 실제로 호출할 떄 전달하는 값
>       * 위에 코드에서 "Hoon"

</br>

### 2.2. 매개변수
>스위프트의 함수는 매개변수 정의에 따라 모습이 많이 달라진다.

</br>

**매개변수가 없는 함수와 매개변수가 여러 개인 함수**

</br>

```swift
func helloWorld() -> String {
    return "Hello, world!"
}   // Hello, world!

print(helloWorld()) 

func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "yagom", yourName: "Hoon"))  // Hello Hoon! I'm yagom
```

</br>

**매개변수 이름과 전달인자 레이블**  
* 매개변수 이름(Parameter Name): 호출 시에 매개변수에 붙이는 이름
* 전달인자 레이블(Argument Label)
  * 매개변수이름과 전달인자 레이블을 다르게 지정하면 함수 외부에서 매개변수의 역할을 좀더 명확히 할 수있다. 

</br>

```swift
// from과 to라는 전달인자 레이블이 있으며
// myNmae과 name이라는 매개변수 이름이 있는 sayHello 함수
func sayHello(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

print(sayHello(from: "yagom", to: "Hoon"))
// Hello Hoon! I'm yagom
```

> **TIP**
> 스위프에서 기본적으로 사용하는 키워드를 매개변수로 사용하려면
> `'`(backquote)를 사용해 이름을 감싸주면 된다. 
> `'`var`'`

* C 언어나 자바 같은 기존 언어처럼 전달인자 레이블을 사용하고 싶지 않다면 **와일드카드 식별자** 사용

```swift
// 전달인자 레이블이 없는 함수 정의와 사용
func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

print(sayHello("Choper", 2))    // Hello Choper! Hello Choper!
```

* 전달인자 레이블을 변경하면 함수의 이름자체가 변경돼 중복 정의(overload)로 동작가능
  * 전달인자를 사용하는 경우 매개변수 이름과 타입이 같은 함수를 매개변수 이름만 바꿔서 중복 정의(overload)할 수 없다.

```swift
func sayHello(to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

func sayHello(to name: String, repaetCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

print(sayHello(to: "Chope", 2))
print(sayHello(to: "Chope", repaetCount: 2))
```

</br>

**매개변수 기본값**
* 매개변수마다 기본값을 지정할 수 있다.
* 매개변수 기본값이 있는 함수는 함수를 주복 정의한 것처럼 사용가능

</br>

```swift
func sayHello(_ name: String, times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

// times 매개변수의 전달 값을 넘겨주지 않아 기본값 3을 반영
print(sayHello("hana"))     // Hello hana! Hello hana! Hello hana!


// times 매개변수의 전달 값을 2로 넘겨줌
print(sayHello("hoon", times: 2))   // Hello hoon! Hello hoon!
```

</br>

>* 기본값이 없는 매개변수를 기본값이 있는 매개변수 보다 앞에 사용한다.
>* 기본값이 없는 매개변수는 대체로 중요한 값을 전달한다.
>* 중요한 매개변수는 앞쪽에 배치하는것이 좋다

</br>

> **TIP** print 함수 
> </br>
> print(_ items: Any..., separator: String, terminator: String)
> * terminator 매개변수의 default 값은 줄바꿈 문자(\n)
>   * 빈문자열 "" 입력시 줄바꿈 되지 않는다.
> * separator 매개변수의 default 값은 공백(띄어쓰기)
>   * items 매개변수를 통해 들어온 값을 분리해서 표시해준다

</br>

**가변 매개변수와 입출력 매개변수**
* 매개변수로 몇 개의 값이 들어올지 모를 때 사용
* 0개 이상의 값을 받아올 수 있고 들어온 인자 값은 배열 처럼 사용
* 함수마다 가변 매개변수는 하나만 가질 수 있다.

```swift
// 가변 매개변수 사용
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result
}

print((sayHelloToFriends(me: "Hoon", friends: "A", "B", "C", "D", "E")))
// Hello A! Hello B! Hello C! Hello D! Hello E! I'm Hoon!

print((sayHelloToFriends(me: "Hoon")))
//I'm Hoon!
```

</br>

* 함수의 전달인자로 값을 전달 할떄는 보통 값을 복사해서 전달한다.
* 참조를 전달 하려면 입출력 매개변수를 사용해야한다.
* C 언어의 포인터와 유사하지만 함수 외부의 값에 영향을 줄 수도있어서 함수형 패러다임에서는 지양하는 패턴이다.
* 입출력 매개변수의 전달 순서
  1. 함수를 호출할 떄, 전달인자의 값을 복사합니다.
  2. 해당 전달인자의 값을 변경하면 1에서 복사한 것을 함수 내부에서 변경합니다.
  3. 함수를 반환하는 시점에 2에서 변경된 값을 원래의 매개변수에 할당합니다.
* 참조는 inout 매개변수로 전달될 변수 또는 상수 앞에 앰퍼샌드(&)를 붙인다.

</br>

```swift
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameer(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameer(numbers)
print(numbers[1])   // 2

referenceParameter(&numbers)    // 참조를 표현하기 위해 &를 붙여줍니다.
print(numbers[1])   // 1
```

</br>

* 입출력 매개변수는 기본값을 가질 수 없고 가변 매개변수로 사용될 수 없다.
* 입출력 매개변수의 전달인자로 상수는 사용될수 없다.
* 잘못 사용시 메모리 안전(memory safety)을 위협한다. 

</br>

## 2.3. 반환이 없는 함수
* Void로 표기하거나 반환 타입 표현을 생략

```swift
func sayHelloWorld() {
    print("Hello, world!")

}
sayHelloWorld()     // Hello, world!

func sayGoodbye() -> Void {     // Void를 명시
    print("Good bye")
}
sayGoodbye()    // Good bye
```

</br>

## 2.4. 데이터 타입으로서의 함수

> 스위프트의 함수는 일급 개체이므로 하나의 대이터 타입으로 사용할 수 있다.
> 각 함수는 매개변수 타입과 반환 타입으로 구성된 하나의 타입으로 사용(정의)할 수있다.
> * (매개변수 타입의 나열) -> 반환 타입 </br>
>   * (String, Int) -> String
>   * (String, String...) -> String
>   * (void) -> Void, () -> Void, () -> ()

</br>

> **함수의 축약 표현** </br>
> 이름과 매개변수 개수를 이용해 축약 </br>
> sayHello(name: String, times: Int) -> String </br>
> sayHello(name:times:)

* 함수 타입의 사용

```swift
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts

print(mathFunction(2 ,5))   // 2 + 5 = 7

mathFunction = multiplyTwoInts(_:_:)
print(mathFunction(2, 5))   // 2 * 5 = 10
```

</br>

```swift
* 전달인자로 함수를 전달받는 함수

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)   // Result: 8
```

</br>

* 특정 조건에 따라 적잘한 함수를 반환해주는 함수

```swift
func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5 )    // Result: 8
```

</br>

> 전달인자 레이블은 함수 타입의 구성요소가 아니므로 함수 타입을 작성할 떄는 전달인자 레이블을 써줄 수 없다. </br>
> ```swift
> let someFunction: (lhs: Int, rhs: Int) -> Int     // 요류
> let someFunction: (_ lhs: Int, _ rhs: Int) -> Int // OK
> let someFunction: (Int, Int) -> Int               // OK
> ```

</br>

## 3. 중첩 함수
* 스위프트는 데이터 타입의 중첩이 자유롭다
  * 열거혀 안에 또 하나의 열거형, 클래스 안에 또 다른 클래스
* 함수 안의 함수로 구현된 중첩 함수는 상위 함수의 몸통 블록 내부에서만 함수를 사용할 수 있다.

```swift
"""
| -3 | -2 | -1 | 0 | 1 | 2 | 3 |
특정 위치에서 원점으로 이동하는 함수
"""

typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

let moveToZero: MoveFunc = functionForMove(position > 0)

// 원점에 도착하면 종료
while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}

print("원점 도착!")
```

## 4. 종료되지 않는 함수
> 스위프트에는 정상적으로 끝나지 않는 종료(return)되지 않는 함수가 있다. 이를 비반환 함수(Nonereturning function), 비반환 메서드(Nometurning method)라고 한다. 비반환 함수 안에서는 오류를 던지든가 오류를 보고하는 등의 일을 하고 프로세스를 종료해 버린다. Never타입으로 명시

```swift
 func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

crashAndBurn()  // 프로세스를 종료 후 오류 보고

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)     // All is well
someFunction(isAllIsWell: false)    // 마을에 도둑이 들었습니다!
// 프로세스 종료 후 오류 보고
```

</br>

## 5. 반환 값을 무시할 수 있는 함수
> 반환 값이 꼭 필요하지 않은 경우가 있다. 프로그래머가 의도적으로 함수의 반환 값을 사용하지 않을 경우 컴파일러가 경고를 보낼때도 있다. 이런경우 @discardableResult 선언 속성을 사용하면된다.

</br>

```swift
func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discadableResultSay(_ something: String) -> String {
    print(something)
    return something
}

// 반환 값을 사용하지 않으므로 컴파일러가 경고를 표시할 수 있다.
say("hello")    // hello

// 반환 값을 사용하지 않아도 컴파일러가 경고하지 않는다.
discadableResultSay("hello")    // hello
```