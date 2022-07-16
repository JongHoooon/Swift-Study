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
