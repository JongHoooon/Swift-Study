enum School {
    case primary, elementary, middle, high, college, university, graduate 
}

var highestEducationLevel: School = School.university

// 위 코드와 같은 표현
var highestEducationLevel: School = .university

// 같은 타입인 School 내부의 항목으로만 highestEducationLevel의 값 변경 가능
highestEducationLevel = .graduate 