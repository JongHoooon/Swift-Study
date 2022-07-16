// 연산자를 통한 문자열 결합
let hello: String = "Hello"
let yagom: String = "yagom"
var greeting: String = hello + " " + yagom + "!"
print(greeting)

greeting = hello
greeting += " "
greeting += yagom
greeting += "!"
print(greeting) // Hello yagom!

// 연산자를 통한 문자열 비교
var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString)

isSameString = hello == "hello"
print(isSameString)

// 메서드를 통한 접두어, 접미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix)

// 프로퍼티를 통한 빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString)

print(greeting.count)

greeting = """
안녕하세요
저는 종훈입니다
잘 부탁합니다!
"""

print(greeting)