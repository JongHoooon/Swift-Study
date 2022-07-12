var names: Set<String> = set<String>()      // 빈 세트 생성
var names: Set<String> = []                 // 빈 세트 생성

// Array와 마찬가지로 대괄호를 사용
var names: Set<String> = ["yagom", "chulsoo", "yonghee", "yagom"]

// 따라서 타입 추론을 사용하면 컴파일러는 Set가 아닌 Array로 타입을 지정한다.
var numbers = [100, 200, 300]
print(type(of: numbers))    // Array<Int>

print(names.isEmpty)        // false
print(names.count)          // 3 ("yagom" 중복 안됨)