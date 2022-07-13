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


// prefix func ! (value: String) -> Bool {
//     return value.isEmpty
// }

// var stringValue: String = "yagom"
// var isEmptyString: Bool = !stringValue
// print(isEmptyString)    // false
