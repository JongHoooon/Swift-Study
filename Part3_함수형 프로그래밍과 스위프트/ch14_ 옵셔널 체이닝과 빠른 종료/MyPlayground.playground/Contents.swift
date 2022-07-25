

class Room {        // 호실
    var number: Int                 // 호실 번호
    
    init(number: Int) {
        self.number = number
    }
}

class Building {    // 건물
    var name: String                // 건물 이름
    var room: Room?                  // 호실 정보
    
    init(name: String) {
        self.name = name
    }
}

struct Address {    // 주소
    var province: String            // 광역시/도
    var city: String                // 시/군/구
    var street: String              // 도로명
    var building: Building?         // 건물
    var detailAddress: String?      // 건물 외 상세 주소
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building {
            
            restAddress = buildingInfo.name
        
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}

class Person {      // 사람
    var name: String                // 이름
    var address: Address?           // 주소
    
    init(name: String) {
        self.name = name
    }
}


//var roomNumber: Int? = nil
//
//if let yagomAddress: Address = yagom.address {
//    if let yagomBuilding: Building = yagomAddress.building {
//        if let yagomRoom: Room = yagomBuilding.room {
//            roomNumber = yagomRoom.number
//        }
//    }
//}
//
//if let number: Int = roomNumber {
//    print(number)
//} else {
//    print("Can not find room number")
//}


let yagom: Person = Person(name: "yagom")

if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}

yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로")
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505

print(yagom.address?.building?.room?.number)    // Optional(505)


yagom.address?.fullAddress()?.isEmpty   // Optional(false)
yagom.address?.printAddress()           // 충청북도 청주시 청원구 충청대로 곰굴



let optionalArray: [Int]? = [1, 2, 3]
optionalArray?[1]   // 2

var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray
optionalDictionary?["numberArray"]?[2]  // 3




// if 구문을 사용한 코드
for i in 0...3 {
    if i == 2 {
        print(i)
    } else {
        continue
    }
}

// guard 구문을 사용한 코드
for i in 0...3 {
    guard i == 2 else { continue }
    print(i)
}





func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else { return }

    print("Hello \(name)!")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"

greet(personInfo)
// Hello Jenny!
// I hope the weather is nice near you

personInfo["location"] = "korea"

greet(personInfo)
// Hello Jenny!
// I hope the weather is nice in korea






func enterClub(name: String?, age: Int?) {
    guard let name: String = name, let age: Int = age, age > 19,
          name.isEmpty == false else {
        print("You are too young to enter the club")
        return
    }
    print("Welcome \(name)!")
}


let first: Int = 3
let second: Int = 5

guard first > second else {
    // 여기에 들어올 제어문 전환 명령은 딱히 없다. 오류!
}
