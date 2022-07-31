


//var doubledNumbers: [Int] = [Int]()
//var strings: [String] = [String]()
//
//// for 구문 사용
//for number in numbers {
//    doubledNumbers.append(number * 2)
//    strings.append("\(number)")
//}
//
//print(doubledNumbers)    // [0, 2, 4, 6, 8]
//print(strings)           // ["0", "1", "2", "3", "4"]
//
//
//
//strings = numbers.map( { (number: Int) -> String in
//    return "\(number)"
//})
//
//print(doubledNumbers)   // [0, 2, 4, 6, 8]
//print(strings)          // ["0", "1", "2", "3", "4"]





//let numbers: [Int] = [0, 1, 2, 3, 4]
//
//// 기본 클로저 표현식 사용
//var doubledNumbers = numbers.map( { (number: Int) -> Int in
//    return number * 2
//})
//
//// 매개변수 및 반환 타입 생략
//doubledNumbers = numbers.map( { return $0 * 2 })
//
//// 반환 키워드 생략
//doubledNumbers = numbers.map( { $0 * 2 })
//
//// 후행 클로저 사용
//doubledNumbers = numbers.map { $0 * 2 }



//let evenNubmers: [Int] = [0, 2, 4, 6, 8]
//let oddNumbers: [Int] = [0, 1, 3, 5, 7]
//let multiplyTwo: (Int) -> Int = { $0 * 2 }
//
//let doubledEvenNumbers = evenNubmers.map(multiplyTwo)
//print(doubledEvenNumbers)   // [0, 4, 8, 12, 16]
//
//let doubledOddNumbers = oddNumbers.map(multiplyTwo)
//print(doubledOddNumbers)    // [0, 2, 6, 10, 14]







//
//
//let alphabetDictionary: [String: String] = ["a":"A", "b":"B"]
//
//var keys: [String] = alphabetDictionary.map { (tuple: (String, String)) ->
//    String in
//    return tuple.0
//}
//print(keys)     // ["b", "a"]
//
//keys = alphabetDictionary.map{ $0.0 }
//
//let values: [String] = alphabetDictionary.map{ $0.1 }
//print(keys)     // ["b", "a"]
//print(values)   // ["B", "A"]
//
//
//var numberSet: Set<Int> = [1, 2, 3, 4, 5]
//let resultSet = numberSet.map{ $0 * 2 }
//print(resultSet)    // [4, 2, 6, 8, 10]
//
//
//let optionalInt: Int? = 3
//let resultInt: Int? = optionalInt.map{ $0 * 2}
//print(resultInt)    // Optional(6)
//
//let range: CountableClosedRange = (0...3)
//let resultRange: [Int] = range.map{ $0 * 2}
//print(resultRange)  // [0, 2, 4, 6]



//
//var numbers: [Int] = [0, 1, 2, 3, 4, 5]
//
//numbers = numbers.map { $0 + 3 }
//
//let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
//    return number % 2 == 0
//}
//print(evenNumbers)  // [4, 6, 8]
//
//let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1 }
//print(oddNumbers)   // [3, 5, 7]



//
//
//let numbers: [Int] = [1, 2, 3]
//
//// 첫 번째 형태인 reduce(_:_:) 메서드의 사용
//
//// 초깃값이 0이고 정수 배열의 모든 값을 더합니다.
//var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
//    print("\(result) + \(next)")
//    // 0 + 1
//    // 1 + 2
//    // 3 + 3
//    return result + next
//})
//
//print(sum)  // 6
//
//// 초깃값이 0이고 정수 배열의 모든 값을 뻅니다.
//let subtract: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
//    print("\(result) - \(next)")
//    // 0 - 1
//    // -1 - 2
//    // -3 - 3
//    return result - next
//})
//
//print(subtract)     // -6
//
//// 초깃값이 3이고 정수 배열의 모든 값을 더합니다.
//let sumFromThree: Int = numbers.reduce(3) {
//    print("\($0) +  \($1)")
//    3 + 1
//    4 + 2
//    6 + 3
//    return $0 + $1
//}
//
//print(sumFromThree)     // 9
//
//// 초깃값이 3이고 정수 배열의 모든 값을 뺍니다.
//var subtractFromThree: Int = numbers.reduce(3) {
//    print("\($0) - \($1)")
//    // 3 - 1
//    // 2 - 2
//    // 0 - 3
//    return $0 - $1
//}
//
//print(subtractFromThree)    // -3
//
//// 문자열 배열을 reduce(_:_:) 메서드를 이용해 연결시킵니다.
//let names: [String] = ["Chope", "Jay", "Joker", "Nova"]
//
//let reduceNames: String = names.reduce("hoon's friend : ") {
//    return $0 + ", " + $1
//}
//
//print(reduceNames) // hoon's friend, Chope, Jay, Joker, Nova
//
//
//// 두 번째 형태인 reduce(into:_:) 메서드의 사용
//
//// 초깃값이 0이고 정수 배열의 모든 값을 더합니다.
//// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서
//// 직접 이전 값을 변경한다는 점이 다릅니다.
//sum = numbers.reduce(into: 0, { (result: inout Int, next: Int) in
//    print("\(result) + \(next)")
//    // 0 + 1
//    // 1 + 2
//    // 3 + 3
//    result += next
//})
//
//print(sum)  // 6
//
//// 초깃값이 3이고 정수 배열의 모든 값을 뻅니다.
//// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서
//// 직접 이전 값을 변경한다는 점이 다릅니다.
//subtractFromThree = numbers.reduce(into: 3, {
//    print("\($0) - \($1)")
//    // 3 - 1
//    // 2 - 2
//    // 0 - 3
//    $0 -= $1
//})
//
//print(subtractFromThree)    // -3
//
//// 첫 번째 리듀스 형태와 다르기 때문에 다른 테이너에 값을 변경하여 넣어줄 수도 있다.
//// 이렇게 하면 맵이나 필터와 유사한 형태로 사용할 수도 있다.
//// 홀수는 걸러내고 짝수만 두 배로 변경하여 초깃값인 [1, 2, 3] 배열에 직접 연삽합니다.
//var doubledNumbers: [Int] = numbers.reduce(into: [1, 2]) { (result: inout [Int], next: Int) in
//    print("result: \(result) next: \(next)")
//    // result: [1, 2] next: 1
//    // result: [1, 2] next: 2
//    // result: [1, 2, 4] next: 3
//
//    guard next.isMultiple(of: 2) else {
//        return
//    }
//
//    print("\(result) append \(next) * 2")
//    // [1, 2] append 2 * 2
//    result.append(next * 2)
//}
//
//print(doubledNumbers)   // [1, 2, 4]
//
//// 필터와 맵을 사용
//doubledNumbers = [1, 2] + numbers.filter { $0.isMultiple(of: 2) }.map { $0 * 2 }
//print(doubledNumbers)   // [1, 2, 4]
//
//// 이름을 모두 대문자로 변환하여 초깃값이 빈 배열에 직접 연산
//var upperCasedNames = names.reduce(into: [], {
//    $0.append($1.uppercased())
//})
//
//print(upperCasedNames)  // ["CHOPE", "JAY", "JOKER", "NOVA"]
//
//// 맵을 사용한 모습
//upperCasedNames = names.map{ $0.uppercased() }
//print(upperCasedNames)  // ["CHOPE", "JAY", "JOKER", "NOVA"]


//let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7]
//
//// 짝수를 걸러내어 각 값에 3을 곱해준 후 모든 값을 더합니다.
//var result: Int = numbers.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3 }.reduce(0){ $0 + $1 }
//print(result)   // 36
//
//// for-in 구문 사용
//result = 0
//
//for number in numbers {
//    guard number.isMultiple(of: 2) else {
//        continue
//    }
//
//    result += number * 3
//}
//print(result)   // 36



enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "Yoobato", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "Jisoo", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "JuHyun", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "JiYoung", gender: .female, location: "서울", age: 22))
friends.append(Friend(name: "SungHo", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "JungKi", gender: .unknown, location: "대전", age: 29))
friends.append(Friend(name: "YoungMin", gender: .male, location: "경기", age: 24))

// 작년에 입력된 자료라서 친구들의 나이는 실제 나이보다 한살이 더 적다

// 서울 외의 지역에 거주하며 25세 이상인 친구
var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }

result = result.filter { $0.location != "서울" && $0.age >= 25 }

let string: String = result.reduce("서울 외의 지역에 거주하며 25세 이상인 친구") {
    $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세 "
}

print(string)
// 서울 외의 지역에 거주하며 25세 이상인 친구
// Yoobato male 발리 27세
// Jisoo male 시드니 25세
// JuHyun male 경기 31세
// JungKi unknown 대전 30세
// YoungMin male 경기 25세
