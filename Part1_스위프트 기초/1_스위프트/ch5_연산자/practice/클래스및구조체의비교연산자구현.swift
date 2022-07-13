class Car {
    var modelYear: Int?     // 연식
    var modelName: String?  // 모델 이름

    // Car 클래스의 인스턴스끼리 == 연산했을 떄 modelName이 같다면 true를 반환
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.modelName == rhs.modelName
    }
}

struct SmartPhone {
    var company: String?    // 제조사
    var model: String?      // 모델

    // SmartPhone 구조체의 인스턴스끼리 == 연산했을 때 model이 같다면 true를 반환
    static func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
        return lhs.model == rhs.model
    }

}



let myCar = Car()
myCar.modelName = "s"

let yourCar = Car()
yourCar.modelName = "s"

print(myCar == yourCar)     // true