// String 타입의 contains(_:) 메서드를 사용하기 위해 Foundation 프레임워크를 임포트 한다.
import Foundation

infix operator **: MultiplicationPrecedence

func ** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}

let helloHoon: String = "Hello hoon"
let hoon: String = "hoon"
let isContainsHoon: Bool = helloHoon ** hoon   
print(isContainsHoon)    // true
