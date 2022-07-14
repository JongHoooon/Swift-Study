var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]

repeat {
    print("Good bye \(names.removeFirst())")
} while names.isEmpty == false
// Good bye Joker
// Good bye Jenny
// Good bye Nova
// Good bye yagom