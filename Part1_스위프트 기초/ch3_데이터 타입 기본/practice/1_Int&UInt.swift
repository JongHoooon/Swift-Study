
var integer: Int = -100
let unsignedInteger: UInt = 50  // UInt 타입에는 음수값을 할당할 수 없다.
print("integer 값: \(integer), unsignedInteger 값: \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")
let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64 최댓값: \(largeInteger), UInte8 최댓값: \(smallUnsignedInteger)")

// let tooLarge: Int = Int.max + 1     // Int의 표현 범위를 초과함으로 오류
// let cannotBeNegetive: UInt = -5     // UInt는 음수가 될 수 없으므로  오류

// integer = unsignedInteger           // Int, UInt는 다름
integer = Int(unsignedInteger)      // Int 타입의 값으로 할당해주어야한다.