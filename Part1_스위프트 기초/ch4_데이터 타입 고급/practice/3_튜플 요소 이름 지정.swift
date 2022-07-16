// String, Int, Double 타입을 갖는 튜플
var person: (name: String, age: Int, height: Double) = ("hoon", 100, 182.5)

// 요소 이름을 통해서 값을 빼 올 수 있다.
print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")

person.age = 24     // 요소 이름을 통해 값을 할당
person.2 = 188      // 인덱스를 통해서도 값을 할당

// 인덱스를 통해 값 출력
print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")

