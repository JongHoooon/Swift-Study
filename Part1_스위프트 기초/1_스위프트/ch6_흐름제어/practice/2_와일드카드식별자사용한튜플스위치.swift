typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("hoon", 21)

switch tupleValue {
    case ("hoon", 24):
        print("정확히 맞췄습니다!")
    case ("hoon", _):
        print("이름만 맞았습니다. 나이는 \(tupleValue.age)입니다")
    case(_, 24):
        print("나이만 맞았습니다. 이름은 \(tupleValue.name)입니다.")
    default:
        print("누굴 찾나요?")    
}

// let을 붙인 값 바인딩 사용해 
// 미리 지정된 조건 값을 제외한 다른 값을 실행문 안으로 가져온다
switch tupleValue {
    case ("hoon", 24):
        print("정확히 맞췄습니다!")
    case ("hoon", let age):
        print("이름만 맞았습니다. 나이는 \(age)입니다")
    case(let name, 24):
        print("나이만 맞았습니다. 이름은 \(name)입니다.")
    default:
        print("누굴 찾나요?")    
}
