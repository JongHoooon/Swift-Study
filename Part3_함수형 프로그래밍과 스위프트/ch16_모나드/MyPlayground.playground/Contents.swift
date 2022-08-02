

func addThree(_ num: Int) -> Int {
    return num + 3
}

var value: Int? = 2
value.map { $0 + 3 }    // Optional(5)

value = nil
value.map { $0 + 3 }    // nil(= Optional<Int>.none)



//extension Optional {
//    func map<U>(f: (Wrapped) -> U) -> U? {
//        switch self {
//        case .some(let x): return f(x)
//        case .none: return .none
//        }
//    }
//}


func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(4).flatMap(doubledEven(_:))


let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map { $0 }
let compactMapped: [Int] = optionals.compactMap { $0 }

print(mapped)           // [Optional(1), Optional(2), nil, Optional(5)]
print(compactMapped)    // [1, 2, 5]



let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
let flatMappedMultipleContainer = multipleContainer.flatMap{ $0.compactMap{ $0 } }

print(mappedMultipleContainer)
// [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
print(flatMappedMultipleContainer)
// [1, 2, 3, 4, 5]


//
//func stringToInteger(_ string: String) -> Int? {
//    return Int(string)
//}
//
//func integerToString(_ integer: Int) -> String? {
//    return "\(integer)"
//}
//
//var optionalString: String?  = "2"
//
//let flattenResult = optionalString.flatMap(stringToInteger)
//    .flatMap(integerToString)
//    .flatMap(stringToInteger)
//
//print(flattenResult)    // Optional(2)
//
//let mappedResult = optionalString.map(stringToInteger)  // 더 이상 체인 연결 불가
//print(mappedResult)     // Optional(Optional(2))

//
//func map<U>(_ transform: (Wrapped) throws -> U) rethrows -> U?
//func flatMap<U>(_ transform: (Wrapped) throws -> U?) rethrows -> U?




func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}
    
var optionalString: String?  = "2"

var result: Int?
//if let string: String = optionalString {
//    if let number: Int = stringToInteger(string) {
//        if let finalString: String = integerToString(number) {
//            if let finalNumber: Int = stringToInteger(finalString) {
//                result = Optional(finalNumber)
//            }
//        }
//    }
//}
//
//print(result)   // Optional(2)
//
//if let string: String = optionalString,
//   let number: Int = stringToInteger(string),
//   let finalString: String = integerToString(number),
//   let finalNumber: Int = stringToInteger(finalString) {
//    result = Optional(finalNumber)
//}

print(result)   // Optional(2)



func integerToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"

result = optionalString.flatMap(stringToInteger)
    .flatMap(integerToNil)
    .flatMap(stringToInteger)

print(result)   // nil
