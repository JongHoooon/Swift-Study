enum School: CaseIterable {
    case primary        // 유치원
    case elementary     // 초등
    case middle         // 중등
    case high           // 고등
    case college        // 대학
    case university     // 대학교
    case graduate       // 대학원
}

let allCases: [School] = School.allCases
print(allCases)
// [main.School.primary, main.School.elementary, main.School.middle, main.School.high, main.School.college, main.School.university, main.School.graduate]