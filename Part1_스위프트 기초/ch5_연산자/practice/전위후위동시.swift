prefix operator **
postfix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let sqrtFivePlusTne: Int = **five**

print(sqrtFivePlusTne)      // ( 10 + 5 ) * ( 10 + 5 ) == 225