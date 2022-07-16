enum Condition: Comparable {
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else {
    print("당신의 상태가 더 좋아요")
}
// 제 상태가 더 좋군요

enum Device: Comparable {
    case iPhone(vestion: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(vestion: "14.3"))
devices.append(.iPhone(vestion: "6.1"))
devices.append(.iPad(version: "10.3"))
devices.append(.macBook)

let sortedDevics: [Device] = devices.sorted()
print(sortedDevics)
// [main.Device.iPhone(vestion: "14.3"), main.Device.iPhone(vestion: "6.1"), main.Device.iPad(version: "10.3"), main.Device.macBook, main.Device.iMac]
