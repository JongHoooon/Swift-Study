let integerValue: Int = 5

switch integerValue {
    case 0:
        print("Value == zero")
    case 1...10:
        print("Value == 1~10")
        // 이번 case를 마치고 switch구문을 탈출 하지 않는다. 아래 case 조건에 무관하게 실행
        fallthrough
    case Int.min..<0, 101..<Int.max:    // 한 번에 여러 값과 비교할 수 있다.
        print("Value < 0 or Value > 100")
        // break 키워드를 통한 종료는 선택 사항
        break
    // 한정된 범위가 명확지 않다면 default 필수
    default:
        print("10 < Value <= 100")
}
// Value == 1~10
// Value < 0 or Value > 100