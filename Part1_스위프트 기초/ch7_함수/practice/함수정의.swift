func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloHoon: String = hello(name: "Hoon")
print(helloHoon)    // Hello Hoon!

func introduce(name: String) -> String {
    // return "제 이름은 " + name + "입니다" 
    "제 이름은 " + name + "입니다"
}

let introduceHoon: String = introduce(name: "Hoon")
print(introduceHoon)    // 제 이름은 Hoon입니다