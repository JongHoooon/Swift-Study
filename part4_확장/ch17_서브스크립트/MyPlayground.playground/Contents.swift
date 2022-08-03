

//subscript(index:: Int) -> Int {
//    get {
//        // 적절한 서브스크립트 결괏값 반환
//    }
//
//    set {
//        // 적절한 설정자 역할 수행
//    }
//}


//subscript(Index: Int) -> Int {
//    get {
//        // 적절한 서브스크립트 값 반환
//    }
//}
//
//subscript(Index: Int) -> Int {
//    // 적절한 서브스크립트 결괏값 반환
//}




//struct Student {
//    var name: String
//    var number: Int
//}
//
//class School {
//
//    var number: Int = 0
//    var students: [Student] = [Student]()
//
//    func addStudent(name: String) {
//        let student: Student = Student(name: name, number: self.number)
//        self.students.append(student)
//        self.number += 1
//    }
//
//    func addStudents(names: String...) {
//        for name in names {
//            self.addStudent(name: name)
//        }
//    }
//
//    subscript(index: Int) -> Student? {     // 첫 번째 서브스크립트
//        get {
//            if index < self.number {
//                return self.students[index]
//            }
//            return nil
//        }
//
//        set {
//            guard var newStudent: Student = newValue else { return }
//
//            var number: Int = index
//
//            if index > self.number {
//                number = self.number
//                self.number += 1
//            }
//
//            newStudent.number = number
//            self.students[number] = newStudent
//        }
//    }
//
//    subscript(name: String) -> Int? {       // 두 번째 서브스크립트
//        get {
//            return self.students.filter{ $0.name == name }.first?.number
//        }
//
//        set {
//            guard var number: Int = newValue else { return }
//
//            if number > self.number {
//                number = self.number
//                self.number += 1
//            }
//
//            let newStudent: Student = Student(name: name, number: number)
//            self.students[number] = newStudent
//        }
//    }
//
//    subscript(name: String, number: Int) -> Student? {      // 세 번째 서브스크립트
//        return self.students.filter{ $0.name == name && $0.number == number }.first
//    }
//}
//
//
//let highSchool: School = School()
//highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "SeongUk", "MoonDuk")
//
//let aStudent: Student? = highSchool[1]
//print("\(aStudent?.number) \(aStudent?.name)")      // Optional(1) Optional("JiYoung")
//
//print(highSchool["MiJeong"])     // Optional(0)
//print(highSchool["DongJin"])     // nil
//
//highSchool[0] = Student(name: "HongEui", number: 0)
//highSchool["MangGu"] = 1
//
//print(highSchool["JuHyun"])         // nil
//print(highSchool["MangGu"])         // Optional(1)
//print(highSchool["SeongUk", 3])     // Optional(Student(name: "SeongUk", number: 3))
//print(highSchool["HeeJin", 3])      // nil


enum School: Int {
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School? {
        return Self(rawValue: level)
        // return School(rawValue: level)과 같은 표현
    }
}

let school: School? = School[2]
print(school)       // Optional(School.middle)

