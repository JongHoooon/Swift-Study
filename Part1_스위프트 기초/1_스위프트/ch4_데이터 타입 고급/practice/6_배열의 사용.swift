var names: [String] = ["yagom", "chulsoo", "yonghee", "yagom"]

print(names[2])         // yonghee
names[2] = "jenny"
print(names[2])
// print(names[4])

// names[4] = "elsa"            // 범위를 벗어나 익셉션 오류(Exception Error)
names.append("elsa")            // 마지막에 elsa 추가
names.append(contentsOf: ["John", "max"])   // 마지막에 요소 2개 추가
// 인덱스 5의 위치에 삽입
names.insert("happy", at: 2)
names.insert(contentsOf: ["jinhee", "minsoo"], at: 5)

// 옵셔녈
print(names.firstIndex(of: "yagom"))
print(names.firstIndex(of: "christal"))
print(names.first)
print(names.last)


print("names: \(names)")
let firstItem: String = names.removeFirst()
let lastItem:  String = names.removeLast()
let indexZeroItem: String = names.remove(at: 0)


print(firstItem)
print(lastItem)
print(indexZeroItem)
print(names[1...3])