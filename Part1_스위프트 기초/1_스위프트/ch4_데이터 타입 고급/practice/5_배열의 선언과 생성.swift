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