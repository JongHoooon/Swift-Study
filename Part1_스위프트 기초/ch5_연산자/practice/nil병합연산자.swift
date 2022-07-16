// 강제 추출 연산자 사용 지양
let valueInt: Int = someOptionalInt != nil ? someOptionalInt! : 0

// 같은 결과이지만 안전하게 옵셔널을 다룰 수 있다.
let valueInt: Int = someOptionalInt ?? 0
