func helloWorld() -> String {
    return "Hello, world!"
}   // Hello, world!

print(helloWorld()) 

func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "yagom", yourName: "Hoon"))  // Hello Hoon! I'm yagom
