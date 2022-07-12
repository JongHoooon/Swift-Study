// String, Int, Double 타입을 갖는 튜플
var person: (String, Int, Double) = ("yagom", 100, 182.5)

// 인덱스를 통해 값을 빼 올 수 있다.
print("이름: \(person.0), 나이 \(person.1), 신장: \(person.2)")

// 인덱스를 통해 값을 할당
person.1 = 99
person.2 = 178.5

print("이름: \(person.0), 나이 \(person.1), 신장: \(person.2)")

