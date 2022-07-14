let stringValue: String = "Liam Neeson"

switch stringValue {
    case "yagom":
        print("He is yagom")
    // 비교 값은 입력 값과 데이터 타입이 같아야한다
    // 다름으로 오류
    case 3
        print("He is 3")
    case "Jenny":
        // 실행될 코드가 있어야한다.
        // 비어 있으므로 오류
    default:
        print("\(stringValue) said 'I don't know who you are'")
}